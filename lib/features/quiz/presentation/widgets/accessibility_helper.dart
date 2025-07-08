import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Accessibility support for quiz components
class AccessibilityQuizHelper {
  /// Announce quiz progress to screen reader
  static void announceProgress(BuildContext context, int current, int total) {
    SemanticsService.announce(
      'Question $current of $total',
      TextDirection.ltr,
    );
  }

  /// Announce feedback result
  static void announceFeedback(BuildContext context, bool isCorrect, String? explanation) {
    final message = isCorrect 
        ? 'Correct answer! ${explanation ?? ""}'
        : 'Incorrect answer. ${explanation ?? ""}';
    
    SemanticsService.announce(
      message,
      TextDirection.ltr,
    );
  }

  /// Announce quiz completion
  static void announceQuizCompletion(BuildContext context, int correctAnswers, int totalQuestions) {
    final percentage = (correctAnswers / totalQuestions * 100).round();
    SemanticsService.announce(
      'Quiz completed! You scored $correctAnswers out of $totalQuestions questions correct. That\'s $percentage percent.',
      TextDirection.ltr,
    );
  }
}

/// Accessible wrapper for quiz options
class AccessibleQuizOption extends StatelessWidget {
  final Widget child;
  final String optionText;
  final bool isSelected;
  final bool showAnswer;
  final bool isCorrect;
  final VoidCallback? onTap;

  const AccessibleQuizOption({
    super.key,
    required this.child,
    required this.optionText,
    this.isSelected = false,
    this.showAnswer = false,
    this.isCorrect = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String semanticsLabel = optionText;
    
    if (showAnswer) {
      semanticsLabel += isCorrect ? ', Correct answer' : ', Incorrect answer';
    } else if (isSelected) {
      semanticsLabel += ', Selected';
    }

    return Semantics(
      label: semanticsLabel,
      hint: onTap != null ? 'Double tap to select this option' : null,
      selected: isSelected,
      button: onTap != null,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

/// Accessible progress indicator for quiz
class AccessibleQuizProgress extends StatelessWidget {
  final double progress;
  final int currentQuestion;
  final int totalQuestions;

  const AccessibleQuizProgress({
    super.key,
    required this.progress,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Quiz progress',
      value: '$currentQuestion of $totalQuestions questions',
      child: LinearProgressIndicator(
        value: progress,
        semanticsLabel: 'Quiz progress: ${(progress * 100).round()}% complete',
      ),
    );
  }
}

/// Accessible feedback overlay
class AccessibleFeedbackOverlay extends StatelessWidget {
  final Widget child;
  final bool isCorrect;
  final String? feedbackMessage;

  const AccessibleFeedbackOverlay({
    super.key,
    required this.child,
    required this.isCorrect,
    this.feedbackMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      label: isCorrect ? 'Correct answer' : 'Incorrect answer',
      hint: feedbackMessage,
      child: child,
    );
  }
}

/// Mixin for quiz accessibility features
mixin QuizAccessibilityMixin<T extends StatefulWidget> on State<T> {
  /// Focus node for managing focus
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  /// Request focus for accessibility
  void requestFocus() {
    _focusNode.requestFocus();
  }

  /// Get focus node
  FocusNode get focusNode => _focusNode;
}