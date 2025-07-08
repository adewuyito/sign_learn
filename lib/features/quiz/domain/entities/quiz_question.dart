class QuizQuestion {
  final String id;
  final String questionText;
  final QuestionType type;
  final String? imageUrl;
  final String? videoUrl;
  final List<QuizAnswer> answers;
  final String correctAnswerId;

  const QuizQuestion({
    required this.id,
    required this.questionText,
    required this.type,
    this.imageUrl,
    this.videoUrl,
    required this.answers,
    required this.correctAnswerId,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => QuizQuestion(
        id: json['id'] as String,
        questionText: json['questionText'] as String,
        type: QuestionType.values.firstWhere(
          (e) => e.toString().split('.').last == json['type'],
        ),
        imageUrl: json['imageUrl'] as String?,
        videoUrl: json['videoUrl'] as String?,
        answers: (json['answers'] as List<dynamic>)
            .map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
            .toList(),
        correctAnswerId: json['correctAnswerId'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'questionText': questionText,
        'type': type.toString().split('.').last,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
        'answers': answers.map((e) => e.toJson()).toList(),
        'correctAnswerId': correctAnswerId,
      };
}

class QuizAnswer {
  final String id;
  final String text;
  final String? imageUrl;

  const QuizAnswer({
    required this.id,
    required this.text,
    this.imageUrl,
  });

  factory QuizAnswer.fromJson(Map<String, dynamic> json) => QuizAnswer(
        id: json['id'] as String,
        text: json['text'] as String,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'imageUrl': imageUrl,
      };
}

enum QuestionType {
  text,
  image,
  video,
}