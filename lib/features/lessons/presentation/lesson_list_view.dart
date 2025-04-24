import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/routes/router.dart';
import 'package:sign_learn/routes/sign_learn_router.gr.dart';

import '../data/data.dart';
import 'providers/lessons_provider.dart';

@RoutePage()
class LessonListScreen extends ConsumerWidget {
  final CategoryLevel categoryLevel;
  const LessonListScreen({super.key, required this.categoryLevel});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsByCategoryProvider(categoryLevel));

    return Scaffold(
      appBar: AppBar(title: Text('Lessons')),
      body: Column(
        children: [
          Expanded(
            child: lessons.when(
              data: (lessonList) => ListView.builder(
                itemCount: lessonList.length,
                itemBuilder: (context, index) {
                  final lesson = lessonList[index];
                  return ListTile(
                    title: Text(lesson.title),
                    subtitle: Text('Unit: ${lesson.unit}'),
                    trailing: Icon(
                      lesson.isCompleted ? Icons.check_circle : Icons.circle,
                      color: lesson.isCompleted ? Colors.green : Colors.red,
                    ),
                    onTap: () {
                      // Navigate to lesson details screen
                      SignNavigator.of(context).push(
                        LessonDetailRoute(lessonId: lesson.id),
                      );
                    },
                  );
                },
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, stack) {
                debugPrint("Error message => ${e.toString()}");
                debugPrint("Error message => ${stack.toString()}");
                return Center(child: Text('Error loading lessons'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* 
lessons.when(
              data: (lessonList) => ListView.builder(
                itemCount: lessonList.length,
                itemBuilder: (context, index) {
                  final lesson = lessonList[index];
                  return ListTile(
                    title: Text(lesson.title),
                    subtitle: Text('Unit: ${lesson.unit}'),
                    trailing: Icon(
                      lesson.isCompleted ? Icons.check_circle : Icons.circle,
                      color: lesson.isCompleted ? Colors.green : Colors.red,
                    ),
                    onTap: () {
                      // Navigate to lesson details screen
                    },
                  );
                },
              ),
              loading: () => CircularProgressIndicator(),
              error: (e, stack) => Center(child: Text('Error loading lessons')),
            ),
 */
