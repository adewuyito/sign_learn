import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/commons.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../../../core/core.dart';

import '../../../routes/router.dart';
import '../data/data.dart';
import '../domain/domain.dart';

@RoutePage()
class LessonsByLevelPage extends ConsumerWidget {
  final CategoryLevel categoryLevel; // e.g. 'ASL1'

  const LessonsByLevelPage({super.key, required this.categoryLevel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(
      fetchLessonsByLevelProvider(categoryLevel.levelId),
    );

    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Lessons - ${categoryLevel.name}')),
      body: lessonsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (lessons) {
          final sortedLessons = [...lessons]..sort(
              (a, b) {
                final unitCmp = a.unitOrder.compareTo(b.unitOrder);
                return unitCmp != 0 ? unitCmp : a.order.compareTo(b.order);
              },
            );
          final Map<int, List<LessonModel>> unitMap = {};
          for (final l in sortedLessons) {
            unitMap.putIfAbsent(l.unitOrder, () => []).add(l);
          }

          final sortedUnitKeys = unitMap.keys.toList()..sort();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedUnitKeys.length,
            itemBuilder: (context, idx) {
              final unitOrder = sortedUnitKeys[idx];
              final unitLessons = unitMap[unitOrder]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Unit $unitOrder',
                      style: tt.labelMedium!.copyWith(
                        fontFamily: FontFamily.clashDisplay,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // ~ Lessons inside that unit
                  ...unitLessons.map(
                    (lesson) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: SignActionButton(
                        color: appColors.blue,
                        size: buttonSize(ButtonSize.full),
                        onPressed: () {
                          LevelDetails details = (
                            levelId: categoryLevel.levelId,
                            unitId: 'unit${lesson.unitOrder.toString()}',
                            lessonId: lesson.lessonId,
                          );

                          SignNavigator.of(context).push(
                            SecondLessonDetailRoute(details: details),
                          );
                        },
                        labelWidget: Text(
                          lesson.title,
                          style: tt.labelMedium!.copyWith(
                            fontFamily: FontFamily.athletics,
                            color: appColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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


/* 

ListTile(
                          tileColor: appColors.transparent,
                          leading: CircleAvatar(child: Text('${lesson.order}')),
                          title: Text(lesson.title),
                          onTap: () {
                            // ~ Passed information
                            LevelDetails details = (
                              levelId: categoryLevel.levelId,
                              unitId: 'unit${lesson.unitOrder.toString()}',
                              lessonId: lesson.lessonId,
                            );

                            SignNavigator.of(context).push(
                              SecondLessonDetailRoute(details: details),
                            );
                          },
                        ),

 */


/* 

Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BoxOutline(
                        size: buttonSize(ButtonSize.full),
                        child: Card(
                          child: ListTile(
                            tileColor: appColors.transparent,
                            leading:
                                CircleAvatar(child: Text('${lesson.order}')),
                            title: Text(lesson.title),
                            onTap: () {
                              // ~ Passed information
                              LevelDetails details = (
                                levelId: categoryLevel.levelId,
                                unitId: 'unit${lesson.unitOrder.toString()}',
                                lessonId: lesson.lessonId,
                              );

                              SignNavigator.of(context).push(
                                SecondLessonDetailRoute(details: details),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

 */