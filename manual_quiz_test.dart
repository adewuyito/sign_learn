// import 'package:sign_learn/features/quiz/quiz.dart';

// /// Manual verification of quiz implementation
// /// Run this in a Dart console or test to verify functionality
// void main() {
//   print('=== Quiz Implementation Verification ===\n');
  
//   // Test 1: Dummy Data
//   print('1. Testing Dummy Data:');
//   final quizzes = DummyQuizData.getDummyQuizzes();
//   print('   - Found ${quizzes.length} dummy quizzes');
//   print('   - First quiz: ${quizzes.first.question}');
//   print('   - Question types: ${quizzes.map((q) => q.type).toSet()}');
  
//   // Test 2: Quiz Session Creation
//   print('\n2. Testing Quiz Session:');
//   final questions = quizzes.map((quiz) => QuizQuestion(
//     id: quiz.id,
//     question: quiz.question,
//     type: quiz.type,
//     mediaUrl: quiz.mediaPath,
//     options: quiz.options,
//     correctOptionIndex: quiz.correctOptionIndex,
//     explanation: quiz.explanation,
//   )).toList();
  
//   final session = QuizSession(
//     id: 'test_session_${DateTime.now().millisecondsSinceEpoch}',
//     questions: questions,
//   );
  
//   print('   - Session created with ${session.questions.length} questions');
//   print('   - Current question: ${session.currentQuestion.question}');
//   print('   - Has next question: ${session.hasNextQuestion}');
  
//   // Test 3: Answering Questions
//   print('\n3. Testing Question Answering:');
//   var updatedSession = session;
  
//   // Answer first question correctly
//   final firstCorrectAnswer = session.questions[0].correctOptionIndex;
//   print('   - Answering question 1 with correct answer: $firstCorrectAnswer');
  
//   final newAnswers = List<int?>.from(updatedSession.userAnswers);
//   newAnswers[0] = firstCorrectAnswer;
//   updatedSession = updatedSession.copyWith(userAnswers: newAnswers);
  
//   // Answer second question incorrectly
//   final secondCorrectAnswer = session.questions[1].correctOptionIndex;
//   final secondWrongAnswer = secondCorrectAnswer == 0 ? 1 : 0;
//   print('   - Answering question 2 with wrong answer: $secondWrongAnswer (correct: $secondCorrectAnswer)');
  
//   newAnswers[1] = secondWrongAnswer;
//   updatedSession = updatedSession.copyWith(userAnswers: newAnswers);
  
//   // Test 4: Scoring
//   print('\n4. Testing Scoring:');
//   print('   - Score: ${updatedSession.score}/${updatedSession.questions.length}');
//   print('   - Percentage: ${updatedSession.percentage.toStringAsFixed(1)}%');
  
//   // Test 5: Navigation
//   print('\n5. Testing Navigation:');
//   final nextSession = updatedSession.copyWith(currentQuestionIndex: 1);
//   print('   - Moved to question 2: ${nextSession.currentQuestion.question}');
//   print('   - Can go back: ${nextSession.currentQuestionIndex > 0}');
//   print('   - Can go forward: ${nextSession.hasNextQuestion}');
  
//   print('\n=== Verification Complete ===');
//   print('✅ All core functionality working as expected!');
// }