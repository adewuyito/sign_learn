import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/core.dart';
import '../../../../common/commons.dart';
import '../../../../features/shared/presentation/video_player_widget/advanced_video_player.dart';
import '../../data/data.dart';
import 'accessibility_helper.dart';

/// Enhanced quiz question widget supporting text, video, and image questions
class QuizQuestionWidget extends ConsumerWidget {
  final QuizQuestion question;
  final VoidCallback? onVideoComplete;
  final VoidCallback? onVideoStart;

  const QuizQuestionWidget({
    super.key,
    required this.question,
    this.onVideoComplete,
    this.onVideoStart,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question text
        Text(
          question.questionText,
          style: TextTheme.of(context).headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: appColors.black,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Media content based on question type
        _buildMediaContent(context),
        
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildMediaContent(BuildContext context) {
    switch (question.type) {
      case QuestionType.video:
        return _buildVideoContent();
      case QuestionType.image:
        return _buildImageContent();
      case QuestionType.text:
        return const SizedBox.shrink();
    }
  }

  Widget _buildVideoContent() {
    if (question.mediaUrl == null) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: appColors.grey767676.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appColors.grey767676.withOpacity(0.3)),
        ),
        child: const Center(
          child: Icon(
            Icons.video_library_outlined,
            size: 48,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appColors.black.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AdvancedVideoPlayerWidget(
          videoUrl: question.mediaUrl!,
          onVideoEnd: onVideoComplete,
          onVideoStart: onVideoStart,
        ),
      ),
    );
  }

  Widget _buildImageContent() {
    if (question.mediaUrl == null) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: appColors.grey767676.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appColors.grey767676.withOpacity(0.3)),
        ),
        child: const Center(
          child: Icon(
            Icons.image_outlined,
            size: 48,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appColors.black.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: question.mediaUrl!,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: appColors.grey767676.withOpacity(0.1),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: appColors.grey767676.withOpacity(0.1),
            child: const Center(
              child: Icon(
                Icons.broken_image,
                size: 48,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Enhanced options widget with better styling and animations
class EnhancedOptionsWidget extends ConsumerWidget {
  final QuizQuestion question;
  final int? selectedIndex;
  final Function(int) onOptionSelected;
  final bool showCorrectAnswer;

  const EnhancedOptionsWidget({
    super.key,
    required this.question,
    this.selectedIndex,
    required this.onOptionSelected,
    this.showCorrectAnswer = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2.0,
      ),
      itemCount: question.options.length,
      itemBuilder: (context, index) {
        final option = question.options[index];
        final isSelected = selectedIndex == index;
        final isCorrect = index == question.correctAnswerIndex;
        
        return _buildOptionCard(
          context,
          option,
          index,
          isSelected,
          isCorrect,
          showCorrectAnswer,
        );
      },
    );
  }

  Widget _buildOptionCard(
    BuildContext context,
    QuizOption option,
    int index,
    bool isSelected,
    bool isCorrect,
    bool showCorrectAnswer,
  ) {
    Color borderColor = appColors.black.withOpacity(0.2);
    Color backgroundColor = Colors.white;
    Color textColor = appColors.black;

    if (showCorrectAnswer) {
      if (isCorrect) {
        borderColor = appColors.green;
        backgroundColor = appColors.green.withOpacity(0.1);
        textColor = appColors.green;
      } else if (isSelected && !isCorrect) {
        borderColor = appColors.red;
        backgroundColor = appColors.red.withOpacity(0.1);
        textColor = appColors.red;
      }
    } else if (isSelected) {
      borderColor = appColors.blue;
      backgroundColor = appColors.blue.withOpacity(0.1);
      textColor = appColors.blue;
    }

    return AccessibleQuizOption(
      optionText: option.text,
      isSelected: isSelected,
      showAnswer: showCorrectAnswer,
      isCorrect: isCorrect,
      onTap: () => onOptionSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: borderColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Option image if available
            if (option.imageUrl != null) ...[
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: option.imageUrl!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: appColors.grey767676.withOpacity(0.1),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: appColors.grey767676.withOpacity(0.1),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            
            // Option text
            Expanded(
              flex: option.imageUrl != null ? 1 : 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Center(
                  child: Text(
                    option.text,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: textColor,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            
            // Correct/incorrect indicator
            if (showCorrectAnswer) ...[
              Container(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  isCorrect 
                      ? Icons.check_circle 
                      : (isSelected && !isCorrect) 
                          ? Icons.close 
                          : null,
                  color: isCorrect ? appColors.green : appColors.red,
                  size: 20,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}