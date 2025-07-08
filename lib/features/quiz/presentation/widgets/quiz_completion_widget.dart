import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class QuizCompletionWidget extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final double scorePercentage;
  final VoidCallback onRetakeQuiz;
  final VoidCallback onContinue;

  const QuizCompletionWidget({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.scorePercentage,
    required this.onRetakeQuiz,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final isPerfectScore = scorePercentage == 100;
    final isGoodScore = scorePercentage >= 70;
    
    return Container(
      padding: EdgeInsets.all(24.dx),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Completion icon
          Container(
            width: 120.dx,
            height: 120.dx,
            decoration: BoxDecoration(
              color: isPerfectScore 
                  ? Colors.amber.shade100 
                  : isGoodScore 
                      ? Colors.green.shade100 
                      : Colors.orange.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPerfectScore 
                  ? Icons.emoji_events 
                  : isGoodScore 
                      ? Icons.check_circle 
                      : Icons.trending_up,
              size: 60.sp,
              color: isPerfectScore 
                  ? Colors.amber.shade600 
                  : isGoodScore 
                      ? Colors.green.shade600 
                      : Colors.orange.shade600,
            ),
          ),
          
          YBox(24.dy),
          
          // Completion message
          Text(
            'Quiz Complete!',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          
          YBox(8.dy),
          
          Text(
            _getCompletionMessage(),
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
          
          YBox(32.dy),
          
          // Score display
          Container(
            padding: EdgeInsets.all(20.dx),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Text(
                  '${scorePercentage.toInt()}%',
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    color: _getScoreColor(),
                  ),
                ),
                YBox(8.dy),
                Text(
                  '$correctAnswers out of $totalQuestions correct',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          
          YBox(40.dy),
          
          // Action buttons
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16.dy),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Continue Learning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              YBox(12.dy),
              
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onRetakeQuiz,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.dy),
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Retake Quiz',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.sp,
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

  String _getCompletionMessage() {
    if (scorePercentage == 100) {
      return 'Perfect! You got every question right!';
    } else if (scorePercentage >= 80) {
      return 'Great job! You\'re mastering sign language!';
    } else if (scorePercentage >= 60) {
      return 'Good work! Keep practicing to improve!';
    } else {
      return 'Keep learning! Practice makes perfect!';
    }
  }

  Color _getScoreColor() {
    if (scorePercentage >= 80) {
      return Colors.green.shade600;
    } else if (scorePercentage >= 60) {
      return Colors.orange.shade600;
    } else {
      return Colors.red.shade600;
    }
  }
}