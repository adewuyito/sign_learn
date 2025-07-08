import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/api/http/dio_http_api.dart';
import '../models/models.dart';

/// Remote data source for quiz operations
abstract class QuizRemoteDataSource {
  /// Fetch quiz questions for a specific lesson
  Future<List<QuizQuestion>> getQuizQuestions(String lessonId);
  
  /// Submit quiz response
  Future<void> submitQuizResponse(QuizResponse response);
  
  /// Save quiz session
  Future<void> saveQuizSession(QuizSession session);
  
  /// Get quiz session by ID
  Future<QuizSession?> getQuizSession(String sessionId);
  
  /// Get user's quiz history
  Future<List<QuizSession>> getUserQuizHistory(String userId);
}

/// Implementation of quiz remote data source
class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final IHttpApi _httpApi;

  QuizRemoteDataSourceImpl(this._httpApi);

  @override
  Future<List<QuizQuestion>> getQuizQuestions(String lessonId) async {
    try {
      final response = await _httpApi.get('/quiz/lessons/$lessonId/questions');
      
      if (response.data is List) {
        return (response.data as List)
            .map((json) => QuizQuestion.fromJson(json))
            .toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to fetch quiz questions: $e');
    }
  }

  @override
  Future<void> submitQuizResponse(QuizResponse response) async {
    try {
      await _httpApi.post(
        '/quiz/responses',
        data: response.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to submit quiz response: $e');
    }
  }

  @override
  Future<void> saveQuizSession(QuizSession session) async {
    try {
      await _httpApi.post(
        '/quiz/sessions',
        data: session.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to save quiz session: $e');
    }
  }

  @override
  Future<QuizSession?> getQuizSession(String sessionId) async {
    try {
      final response = await _httpApi.get('/quiz/sessions/$sessionId');
      
      if (response.data != null) {
        return QuizSession.fromJson(response.data);
      }
      
      return null;
    } catch (e) {
      throw Exception('Failed to fetch quiz session: $e');
    }
  }

  @override
  Future<List<QuizSession>> getUserQuizHistory(String userId) async {
    try {
      final response = await _httpApi.get(
        '/quiz/users/$userId/history',
        queryParameters: {
          'limit': 50,
          'orderBy': 'completedAt',
          'order': 'desc',
        },
      );
      
      if (response.data is List) {
        return (response.data as List)
            .map((json) => QuizSession.fromJson(json))
            .toList();
      }
      
      return [];
    } catch (e) {
      throw Exception('Failed to fetch user quiz history: $e');
    }
  }
}

/// Provider for quiz remote data source
final quizRemoteDataSourceProvider = Provider<QuizRemoteDataSource>((ref) {
  final httpApi = ref.read(dioHttpApiProvider);
  return QuizRemoteDataSourceImpl(httpApi);
});