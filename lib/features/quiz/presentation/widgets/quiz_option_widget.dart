import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../domain/entities/quiz_question.dart';

class QuizOptionWidget extends StatelessWidget {
  final QuizAnswer answer;
  final bool isSelected;
  final bool showFeedback;
  final bool isCorrect;
  final bool isCorrectAnswer;
  final VoidCallback onTap;

  const QuizOptionWidget({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.showFeedback,
    required this.isCorrect,
    required this.isCorrectAnswer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade300;
    Color backgroundColor = Colors.white;
    Widget? leadingIcon;

    if (showFeedback) {
      if (isSelected && isCorrect) {
        // Selected and correct
        borderColor = Colors.green;
        backgroundColor = Colors.green.shade50;
        leadingIcon = Icon(Icons.check_circle, color: Colors.green, size: 24.sp);
      } else if (isSelected && !isCorrect) {
        // Selected but incorrect
        borderColor = Colors.red;
        backgroundColor = Colors.red.shade50;
        leadingIcon = Icon(Icons.cancel, color: Colors.red, size: 24.sp);
      } else if (!isSelected && isCorrectAnswer) {
        // Not selected but is the correct answer
        borderColor = Colors.green;
        backgroundColor = Colors.green.shade50;
        leadingIcon = Icon(Icons.check_circle_outline, color: Colors.green, size: 24.sp);
      }
    } else if (isSelected) {
      // Selected but no feedback yet
      borderColor = Colors.blue;
      backgroundColor = Colors.blue.shade50;
    }

    return GestureDetector(
      onTap: showFeedback ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(16.dx),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Leading icon or radio button
            if (leadingIcon != null)
              leadingIcon
            else
              Radio<bool>(
                value: true,
                groupValue: isSelected,
                onChanged: showFeedback ? null : (_) => onTap(),
                activeColor: Colors.blue,
              ),
            
            XBox(12.dx),
            
            // Answer content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (answer.imageUrl != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        answer.imageUrl!,
                        height: 60.dy,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 60.dy,
                            color: Colors.grey.shade200,
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey.shade500,
                            ),
                          );
                        },
                      ),
                    ),
                    YBox(8.dy),
                  ],
                  
                  Text(
                    answer.text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}