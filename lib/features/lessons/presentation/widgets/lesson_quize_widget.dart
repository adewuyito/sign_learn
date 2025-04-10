import 'package:flutter/material.dart';

class LessonQuizWidget extends StatelessWidget {
  final String lessonId;

  const LessonQuizWidget({
    super.key,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiz Questions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),

        // For now, this is just a mock-up of a question.
        // This could be replaced with dynamic content based on the lesson.
        QuizQuestionWidget(
          question: 'What is ASL?',
          options: [
            'American Sign Language',
            'African Sign Language',
          ],
        ),
      ],
    );
  }
}

class QuizQuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;

  const QuizQuestionWidget({

    super.key,
    required this.question,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question, style: TextStyle(fontSize: 16)),
            for (var option in options)
              RadioListTile(
                title: Text(option),
                value: option,
                groupValue: null, // This would be set dynamically
                onChanged: (value) {},
              ),
          ],
        ),
      ),
    );
  }
}
