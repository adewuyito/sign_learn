import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/core.dart';
import '../../../../common/commons.dart';
import '../providers/quiz_controller.dart';

/// Feedback overlay component showing correct/incorrect responses
class FeedbackOverlay extends ConsumerWidget {
  const FeedbackOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackState = ref.watch(quizFeedbackProvider);
    final feedbackMessage = ref.watch(quizFeedbackMessageProvider);
    final showingFeedback = ref.watch(showingFeedbackProvider);
    final controller = ref.read(quizControllerProvider.notifier);

    if (!showingFeedback || feedbackState == QuizFeedbackState.none) {
      return const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: _getIconBackgroundColor(feedbackState),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getIcon(feedbackState),
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Title
                Text(
                  _getTitle(feedbackState),
                  style: TextTheme.of(context).headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _getIconBackgroundColor(feedbackState),
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Message
                if (feedbackMessage != null) ...[
                  Text(
                    feedbackMessage,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: appColors.grey767676,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                ],
                
                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (feedbackState == QuizFeedbackState.incorrect) ...[
                      // Retry button for incorrect answers
                      Expanded(
                        child: SignActionButton(
                          onPressed: () => controller.retryQuestion(),
                          labelWidget: const Text('Try Again'),
                          backgroundColor: appColors.orange,
                        ),
                      ),
                    ] else ...[
                      // Continue button for correct answers
                      Expanded(
                        child: SignActionButton(
                          onPressed: () => controller.nextQuestion(),
                          labelWidget: const Text('Continue'),
                          backgroundColor: appColors.green,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getIconBackgroundColor(QuizFeedbackState state) {
    switch (state) {
      case QuizFeedbackState.correct:
        return appColors.green;
      case QuizFeedbackState.incorrect:
        return appColors.red;
      case QuizFeedbackState.none:
        return appColors.grey767676;
    }
  }

  IconData _getIcon(QuizFeedbackState state) {
    switch (state) {
      case QuizFeedbackState.correct:
        return Icons.check_circle;
      case QuizFeedbackState.incorrect:
        return Icons.close;
      case QuizFeedbackState.none:
        return Icons.help_outline;
    }
  }

  String _getTitle(QuizFeedbackState state) {
    switch (state) {
      case QuizFeedbackState.correct:
        return 'Correct!';
      case QuizFeedbackState.incorrect:
        return 'Incorrect';
      case QuizFeedbackState.none:
        return '';
    }
  }
}

/// Animated feedback overlay that appears from bottom
class AnimatedFeedbackOverlay extends ConsumerWidget {
  const AnimatedFeedbackOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackState = ref.watch(quizFeedbackProvider);
    final feedbackMessage = ref.watch(quizFeedbackMessageProvider);
    final showingFeedback = ref.watch(showingFeedbackProvider);
    final controller = ref.read(quizControllerProvider.notifier);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: showingFeedback ? 0 : -200,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _getBackgroundColor(feedbackState),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIcon(feedbackState),
                color: Colors.white,
                size: 24,
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _getTitle(feedbackState),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (feedbackMessage != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      feedbackMessage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Action button
            if (feedbackState == QuizFeedbackState.incorrect) ...[
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => controller.retryQuestion(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(QuizFeedbackState state) {
    switch (state) {
      case QuizFeedbackState.correct:
        return appColors.green;
      case QuizFeedbackState.incorrect:
        return appColors.red;
      case QuizFeedbackState.none:
        return appColors.grey767676;
    }
  }

  IconData _getIcon(QuizFeedbackState state) {
    switch (state) {
      case QuizFeedbackState.correct:
        return Icons.check_circle;
      case QuizFeedbackState.incorrect:
        return Icons.close;
      case QuizFeedbackState.none:
        return Icons.help_outline;
    }
  }

  String _getTitle(QuizFeedbackState state) {
    switch (state) {
      case QuizFeedbackState.correct:
        return 'Correct!';
      case QuizFeedbackState.incorrect:
        return 'Incorrect';
      case QuizFeedbackState.none:
        return '';
    }
  }
}