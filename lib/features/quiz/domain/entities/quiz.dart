enum QuestionType { text, image, video }

class Quiz {
  final String id;
  final String question;
  final QuestionType type;
  final String? mediaPath;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  Quiz({
    required this.id,
    required this.question,
    required this.type,
    this.mediaPath,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });
}