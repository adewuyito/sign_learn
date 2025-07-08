import '../domain/entities/quiz.dart';

class DummyQuizData {
  static List<Quiz> getDummyQuizzes() {
    return [
      Quiz(
        id: '1',
        question: 'What is the sign for "Hello"?',
        type: QuestionType.video,
        mediaPath: 'assets/dummy_videos/hello_sign.mp4',
        options: [
          'Wave hand near face',
          'Touch forehead',
          'Cross arms',
          'Point forward'
        ],
        correctOptionIndex: 0,
        explanation: 'The sign for "Hello" is a friendly wave near your face.',
      ),
      Quiz(
        id: '2',
        question: 'Which sign represents "Thank you"?',
        type: QuestionType.image,
        mediaPath: 'assets/dummy_images/thank_you_sign.png',
        options: [
          'Touch lips and move forward',
          'Wave hand',
          'Tap chest',
          'Nod head'
        ],
        correctOptionIndex: 0,
        explanation: 'To sign "Thank you", touch your lips and move your hand forward.',
      ),
      Quiz(
        id: '3',
        question: 'What does this sign mean?',
        type: QuestionType.video,
        mediaPath: 'assets/dummy_videos/good_morning_sign.mp4',
        options: [
          'Good morning',
          'Good night',
          'Hello',
          'Goodbye'
        ],
        correctOptionIndex: 0,
        explanation: 'This is the sign for "Good morning".',
      ),
      Quiz(
        id: '4',
        question: 'Choose the correct meaning for this sign:',
        type: QuestionType.image,
        mediaPath: 'assets/dummy_images/please_sign.png',
        options: [
          'Please',
          'Sorry',
          'Excuse me',
          'Thank you'
        ],
        correctOptionIndex: 0,
        explanation: 'This sign means "Please" in sign language.',
      ),
    ];
  }
}