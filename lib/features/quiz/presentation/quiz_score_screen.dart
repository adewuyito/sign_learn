import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/core.dart';
import '../../../../common/commons.dart';
import '../../../../routes/router.dart';
import '../presentation/providers/quiz_controller.dart';

@RoutePage()
class QuizScoreScreen extends ConsumerWidget {
  const QuizScoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentQuizSessionProvider);
    final controller = ref.read(quizControllerProvider.notifier);

    if (session == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        leading: const SizedBox.shrink(), // Prevent back navigation
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(padding.dx),
            child: Column(
              children: [
                const SizedBox(height: 32),

                // Celebration/Score Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: _getScoreColor(session.accuracyPercentage),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getScoreIcon(session.accuracyPercentage),
                    color: Colors.white,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 24),

                // Congratulations message
                Text(
                  _getScoreMessage(session.accuracyPercentage),
                  style: TextTheme.of(context).headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appColors.black,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  _getScoreSubtitle(session.accuracyPercentage),
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: appColors.grey767676,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                // Score Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: appColors.black.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Score percentage
                      Text(
                        '${(session.accuracyPercentage * 100).round()}%',
                        style: TextTheme.of(context).displayLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _getScoreColor(session.accuracyPercentage),
                            ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Accuracy',
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: appColors.grey767676,
                            ),
                      ),

                      const SizedBox(height: 24),

                      // Score breakdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildScoreStat(
                            'Correct',
                            '${session.correctAnswers}',
                            Colors.green,
                          ),
                          _buildScoreStat(
                            'Total',
                            '${session.totalQuestions}',
                            Colors.blue,
                          ),
                          _buildScoreStat(
                            'Points',
                            '${session.totalScore}',
                            Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Progress indicator
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: appColors.paleGreen.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quiz Progress',
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            '${session.responses.length}/${session.totalQuestions}',
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value:
                            session.responses.length / session.totalQuestions,
                        backgroundColor: Colors.grey[300],
                        valueColor:
                            AlwaysStoppedAnimation<Color>(appColors.paleGreen),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Action buttons
                Column(
                  children: [
                    // Retry quiz button
                    SizedBox(
                      width: double.infinity,
                      child: SignActionButton(
                        onPressed: () {
                          controller.resetQuiz();
                          SignNavigator.of(context).pop();
                        },
                        labelWidget: const Text('Retry Quiz'),
                        color: appColors.blue,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Return to lessons button
                    SizedBox(
                      width: double.infinity,
                      child: SignActionButton(
                        onPressed: () {
                          controller.resetQuiz();
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        labelWidget: const Text('Back to Lessons'),
                        color: appColors.grey767676,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: appColors.grey767676,
          ),
        ),
      ],
    );
  }

  Color _getScoreColor(double accuracy) {
    if (accuracy >= 0.8) return appColors.paleGreen;
    if (accuracy >= 0.6) return appColors.paleOrange;
    return appColors.red;
  }

  IconData _getScoreIcon(double accuracy) {
    if (accuracy >= 0.8) return Icons.emoji_events;
    if (accuracy >= 0.6) return Icons.thumb_up;
    return Icons.trending_up;
  }

  String _getScoreMessage(double accuracy) {
    if (accuracy >= 0.8) return 'Excellent Work!';
    if (accuracy >= 0.6) return 'Good Job!';
    return 'Keep Practicing!';
  }

  String _getScoreSubtitle(double accuracy) {
    if (accuracy >= 0.8) return 'You\'re mastering sign language!';
    if (accuracy >= 0.6) return 'You\'re making great progress!';
    return 'Practice makes perfect!';
  }
}
