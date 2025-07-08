import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class AnswerFeedbackWidget extends StatelessWidget {
  final bool isCorrect;
  final String correctAnswer;
  final String selectedAnswer;
  final VoidCallback onContinue;
  final VoidCallback? onRetry;

  const AnswerFeedbackWidget({
    super.key,
    required this.isCorrect,
    required this.correctAnswer,
    required this.selectedAnswer,
    required this.onContinue,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.dx),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.red,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Feedback icon and message
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
                size: 32.sp,
              ),
              XBox(12.dx),
              Expanded(
                child: Text(
                  isCorrect ? 'Correct!' : 'Incorrect',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
          
          if (!isCorrect) ...[
            YBox(16.dy),
            Container(
              padding: EdgeInsets.all(12.dx),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: Colors.green.shade700,
                    size: 20.sp,
                  ),
                  XBox(8.dx),
                  Expanded(
                    child: Text(
                      'Correct answer: $correctAnswer',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          YBox(24.dy),
          
          // Action buttons
          Row(
            children: [
              if (!isCorrect && onRetry != null) ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: onRetry,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.dy),
                      side: BorderSide(color: Colors.orange),
                    ),
                    child: Text(
                      'Try Again',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                XBox(12.dx),
              ],
              Expanded(
                child: ElevatedButton(
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCorrect ? Colors.green : Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12.dy),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}