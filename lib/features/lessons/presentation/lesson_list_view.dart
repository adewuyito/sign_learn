import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../../../core/core.dart';

@RoutePage()
class LessonListScreen extends HookConsumerWidget {
  final CategoryLevel categoryLevel;
  const LessonListScreen({super.key, required this.categoryLevel});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(
      fetchLessonsByCategoryProvider((
        levelId: categoryLevel.levelId,
        unitId: 'unit1',
      )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: lessonsAsync.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, count) {
              final lesson = data[count];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${count + 1}'),
                  ),
                  title: Text('Lesson ${count + 1}'),
                  subtitle: Text(lesson.title),
                  trailing: Icon(Icons.play_arrow),
                  onTap: () {
                    // TODO: Build this widget
                    // ~ Navigate to the view
                  },
                ),
              );
            },
          ),
          error: (error, stackTrace) => Center(
            child: Column(
              children: [
                Icon(Icons.error),
                Text('An error occured'),
              ],
            ),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
