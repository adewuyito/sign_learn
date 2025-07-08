import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizProgressIndicator extends ConsumerWidget {
  const QuizProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: 0.5, // TODO: Get from provider
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}