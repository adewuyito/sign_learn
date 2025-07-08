import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/models.dart';

/// Local data source for quiz operations (offline support)
abstract class QuizLocalDataSource {
  /// Cache quiz questions locally
  Future<void> cacheQuizQuestions(String lessonId, List<QuizQuestion> questions);
  
  /// Get cached quiz questions
  Future<List<QuizQuestion>?> getCachedQuizQuestions(String lessonId);
  
  /// Save quiz session locally
  Future<void> saveQuizSessionLocally(QuizSession session);
  
  /// Get locally saved quiz session
  Future<QuizSession?> getLocalQuizSession(String sessionId);
  
  /// Get all pending quiz sessions (not synced to server)
  Future<List<QuizSession>> getPendingQuizSessions();
  
  /// Mark quiz session as synced
  Future<void> markSessionAsSynced(String sessionId);
  
  /// Clear cached data
  Future<void> clearCache();
}

/// Implementation of quiz local data source using SharedPreferences
class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  final SharedPreferences _prefs;

  QuizLocalDataSourceImpl(this._prefs);

  static const String _questionsPrefix = 'quiz_questions_';
  static const String _sessionsPrefix = 'quiz_session_';
  static const String _pendingSessionsKey = 'pending_quiz_sessions';

  @override
  Future<void> cacheQuizQuestions(String lessonId, List<QuizQuestion> questions) async {
    final questionsJson = questions.map((q) => q.toJson()).toList();
    final jsonString = jsonEncode(questionsJson);
    await _prefs.setString('$_questionsPrefix$lessonId', jsonString);
  }

  @override
  Future<List<QuizQuestion>?> getCachedQuizQuestions(String lessonId) async {
    final jsonString = _prefs.getString('$_questionsPrefix$lessonId');
    if (jsonString == null) return null;

    try {
      final List<dynamic> questionsJson = jsonDecode(jsonString);
      return questionsJson.map((json) => QuizQuestion.fromJson(json)).toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveQuizSessionLocally(QuizSession session) async {
    // Save individual session
    final sessionJson = jsonEncode(session.toJson());
    await _prefs.setString('$_sessionsPrefix${session.sessionId}', sessionJson);
    
    // Add to pending sessions if not synced
    if (session.status == QuizSessionStatus.completed) {
      await _addToPendingSessions(session.sessionId);
    }
  }

  @override
  Future<QuizSession?> getLocalQuizSession(String sessionId) async {
    final jsonString = _prefs.getString('$_sessionsPrefix$sessionId');
    if (jsonString == null) return null;

    try {
      final sessionJson = jsonDecode(jsonString);
      return QuizSession.fromJson(sessionJson);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<QuizSession>> getPendingQuizSessions() async {
    final pendingSessionIds = _prefs.getStringList(_pendingSessionsKey) ?? [];
    final List<QuizSession> sessions = [];

    for (final sessionId in pendingSessionIds) {
      final session = await getLocalQuizSession(sessionId);
      if (session != null) {
        sessions.add(session);
      }
    }

    return sessions;
  }

  @override
  Future<void> markSessionAsSynced(String sessionId) async {
    final pendingSessionIds = _prefs.getStringList(_pendingSessionsKey) ?? [];
    pendingSessionIds.remove(sessionId);
    await _prefs.setStringList(_pendingSessionsKey, pendingSessionIds);
  }

  @override
  Future<void> clearCache() async {
    final keys = _prefs.getKeys();
    final quizKeys = keys.where((key) => 
        key.startsWith(_questionsPrefix) || 
        key.startsWith(_sessionsPrefix) ||
        key == _pendingSessionsKey).toList();
    
    for (final key in quizKeys) {
      await _prefs.remove(key);
    }
  }

  Future<void> _addToPendingSessions(String sessionId) async {
    final pendingSessionIds = _prefs.getStringList(_pendingSessionsKey) ?? [];
    if (!pendingSessionIds.contains(sessionId)) {
      pendingSessionIds.add(sessionId);
      await _prefs.setStringList(_pendingSessionsKey, pendingSessionIds);
    }
  }
}

/// Provider for SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences provider must be initialized');
});

/// Provider for quiz local data source
final quizLocalDataSourceProvider = Provider<QuizLocalDataSource>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return QuizLocalDataSourceImpl(prefs);
});