import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/core/services/storage/shared_pref_storage_service.dart';
import 'package:sign_learn/core/api/http/dio_http_api.dart';

import '../datasources/quiz_remote_data_source.dart';
import '../datasources/quiz_local_data_source.dart';
import '../models/models.dart';

final quizLocalDataSourceProvider = Provider<QuizLocalDataSource>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return QuizLocalDataSourceImpl(prefs);
});

final quizRemoteDataSourceProvider = Provider<QuizRemoteDataSource>((ref) {
  final httpApi = ref.read(dioHttpApiProvider);
  return QuizRemoteDataSourceImpl(httpApi);
});

/// Provider for quiz repository
final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final remoteDataSource = ref.read(quizRemoteDataSourceProvider);
  final localDataSource = ref.read(quizLocalDataSourceProvider);
  return QuizRepositoryImpl(remoteDataSource, localDataSource);
});

/// Repository interface for quiz operations
abstract class QuizRepository {
  /// Get quiz questions for a lesson
  Future<List<QuizQuestion>> getQuizQuestions(String lessonId,
      {bool forceRefresh = false});

  /// Submit quiz response
  Future<void> submitQuizResponse(QuizResponse response);

  /// Save quiz session
  Future<void> saveQuizSession(QuizSession session);

  /// Get quiz session
  Future<QuizSession?> getQuizSession(String sessionId);

  /// Get user quiz history
  Future<List<QuizSession>> getUserQuizHistory(String userId);

  /// Sync pending sessions to server
  Future<void> syncPendingSessions();

  /// Clear cached data
  Future<void> clearCache();
}

/// Implementation of quiz repository
class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource _remoteDataSource;
  final QuizLocalDataSource _localDataSource;

  QuizRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<List<QuizQuestion>> getQuizQuestions(String lessonId,
      {bool forceRefresh = false}) async {
    try {
      if (!forceRefresh) {
        // Try to get cached questions first
        final cachedQuestions =
            await _localDataSource.getCachedQuizQuestions(lessonId);
        if (cachedQuestions != null && cachedQuestions.isNotEmpty) {
          return cachedQuestions;
        }
      }

      // Fetch from remote and cache
      final questions = await _remoteDataSource.getQuizQuestions(lessonId);
      await _localDataSource.cacheQuizQuestions(lessonId, questions);
      return questions;
    } catch (e) {
      // If remote fails, try to return cached data
      final cachedQuestions =
          await _localDataSource.getCachedQuizQuestions(lessonId);
      if (cachedQuestions != null && cachedQuestions.isNotEmpty) {
        return cachedQuestions;
      }
      // If no cached data, return mock data for demo purposes
      return _getMockQuizQuestions(lessonId);
    }
  }

  @override
  Future<void> submitQuizResponse(QuizResponse response) async {
    try {
      await _remoteDataSource.submitQuizResponse(response);
    } catch (e) {
      // Store locally if remote submission fails
      // This could be implemented by storing responses separately
      // and syncing them later
      throw Exception('Failed to submit quiz response: $e');
    }
  }

  @override
  Future<void> saveQuizSession(QuizSession session) async {
    // Always save locally first
    await _localDataSource.saveQuizSessionLocally(session);
    try {
      // Try to save remotely
      await _remoteDataSource.saveQuizSession(session);
      // Mark as synced if successful
      await _localDataSource.markSessionAsSynced(session.sessionId);
    } catch (e) {
      // Remote save failed, but local save succeeded
      // Session will be synced later
    }
  }

  @override
  Future<QuizSession?> getQuizSession(String sessionId) async {
    // Try local first
    final localSession = await _localDataSource.getLocalQuizSession(sessionId);
    if (localSession != null) {
      return localSession;
    }
    try {
      // Try remote
      final remoteSession = await _remoteDataSource.getQuizSession(sessionId);
      if (remoteSession != null) {
        // Cache locally
        await _localDataSource.saveQuizSessionLocally(remoteSession);
      }
      return remoteSession;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<QuizSession>> getUserQuizHistory(String userId) async {
    try {
      return await _remoteDataSource.getUserQuizHistory(userId);
    } catch (e) {
      // Return empty list if remote fetch fails
      // Could implement local history storage if needed
      return [];
    }
  }

  @override
  Future<void> syncPendingSessions() async {
    try {
      final pendingSessions = await _localDataSource.getPendingQuizSessions();
      for (final session in pendingSessions) {
        try {
          await _remoteDataSource.saveQuizSession(session);
          await _localDataSource.markSessionAsSynced(session.sessionId);
        } catch (e) {
          // Continue with other sessions if one fails
          continue;
        }
      }
    } catch (e) {
      // Sync will be attempted again later
    }
  }

  @override
  Future<void> clearCache() async {
    await _localDataSource.clearCache();
  }

  /// Mock quiz questions for demo/fallback purposes
  List<QuizQuestion> _getMockQuizQuestions(String lessonId) {
    return [
      QuizQuestion(
        questionId: 'mock_1',
        questionText: 'What does this sign mean?',
        type: QuestionType.video,
        mediaUrl: null, // Will show placeholder
        options: [
          const QuizOption(optionId: '1', text: 'Hello', order: 0),
          const QuizOption(optionId: '2', text: 'Goodbye', order: 1),
          const QuizOption(optionId: '3', text: 'Thank you', order: 2),
          const QuizOption(optionId: '4', text: 'Please', order: 3),
        ],
        correctAnswerIndex: 0,
        explanation: 'This sign represents "Hello" in ASL.',
        points: 10,
        lessonId: lessonId,
      ),
      QuizQuestion(
        questionId: 'mock_2',
        questionText:
            'Which option shows the correct fingerspelling for "CAT"?',
        type: QuestionType.text,
        options: [
          const QuizOption(optionId: '5', text: 'C-A-T', order: 0),
          const QuizOption(optionId: '6', text: 'K-A-T', order: 1),
          const QuizOption(optionId: '7', text: 'C-E-T', order: 2),
          const QuizOption(optionId: '8', text: 'S-A-T', order: 3),
        ],
        correctAnswerIndex: 0,
        explanation: 'Fingerspelling follows the standard alphabet.',
        points: 10,
        lessonId: lessonId,
      ),
      QuizQuestion(
        questionId: 'mock_3',
        questionText: 'What does this image represent?',
        type: QuestionType.image,
        mediaUrl: null, // Will show placeholder
        options: [
          const QuizOption(optionId: '9', text: 'Water', order: 0),
          const QuizOption(optionId: '10', text: 'Fire', order: 1),
          const QuizOption(optionId: '11', text: 'Earth', order: 2),
          const QuizOption(optionId: '12', text: 'Air', order: 3),
        ],
        correctAnswerIndex: 0,
        explanation: 'This sign represents water.',
        points: 10,
        lessonId: lessonId,
      ),
    ];
  }
}
