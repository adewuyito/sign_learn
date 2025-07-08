import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerGrid extends ConsumerWidget {
  const AnswerGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Get options from provider
    final options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {
              // TODO: Handle answer selection
            },
            child: Center(
              child: Text(
                options[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}