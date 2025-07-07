
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../data/data.dart';
import '../domain/domain.dart';


@RoutePage()
class LessonsByLevelPage extends ConsumerWidget {
  final String levelId; // e.g. 'ASL1'

  const LessonsByLevelPage({super.key, required this.levelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(fetchLessonsByLevelProvider("asl_lesson1"));

    return Scaffold(
      appBar: AppBar(title: Text('Lessons - $levelId')),
      body: lessonsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (lessons) {
          final sortedLessons = [...lessons]..sort((a, b) {
              final unitCmp = a.unitOrder.compareTo(b.unitOrder);
              return unitCmp != 0 ? unitCmp : a.order.compareTo(b.order);
            });
          final Map<int, List<LessonModel>> unitMap = {};
          for (final l in sortedLessons) {
            unitMap.putIfAbsent(l.unitOrder, () => []).add(l);
          }

          final sortedUnitKeys = unitMap.keys.toList()..sort(); // 1, 2, 3 …

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedUnitKeys.length,
            itemBuilder: (context, idx) {
              final unitOrder = sortedUnitKeys[idx]; // 1, 2, 3 …
              final unitLessons = unitMap[unitOrder]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Unit $unitOrder',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  // Lessons inside that unit
                  ...unitLessons.map(
                    (lesson) => Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${lesson.order}')),
                        title: Text(lesson.title),
                        onTap: () {
                          // TODO: navigate to lesson detail
                          // context.pushRoute(LessonRoute(lessonId: lesson.id));
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}