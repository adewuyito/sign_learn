import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/common/components/components.dart';
import 'package:sign_learn/core/core.dart';
import 'package:sign_learn/features/lessons/data/models/models.dart';
import 'package:sign_learn/gen/fonts.gen.dart';

import '../domain/domain.dart';
import 'providers/lessons_provider.dart';

@RoutePage()
class LessonDetailScreen extends ConsumerWidget {
  final String lessonId;

  const LessonDetailScreen({super.key, this.lessonId = "1"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ref.watch(lessonDetailProvider(lessonId));

    final mockLesson = Lesson(
      id: "asl_lesson1",
      title: "Hose",
      unit: 1,
      categoryLevel: CategoryLevel.ASL1,
      videoUrl: [""],
    );

    Set<String> buildAppbarTitle(CategoryLevel category, int unit) {
      String firstPart = "ASL ${category.index + 1}";
      String secondPart = "Unit $unit";
      return {firstPart, secondPart};
    }

    final appBarTitle =
        buildAppbarTitle(mockLesson.categoryLevel, mockLesson.unit);

    final mockAsyncValue = AsyncData(mockLesson);

    final ftt = TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: FontFamily.satoshi,
    );
    final stt = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: FontFamily.athletics,
    );

    final screenWidth = buttonSize(ButtonSize.full).width;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: mockAsyncValue.when(
          data: (lesson) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichTextWidget(
                  styleForAll: TextStyle(color: appColors.black, fontSize: 24),
                  texts: [
                    BaseText.plain(
                      text: "${appBarTitle.first}, ",
                      style: ftt,
                    ),
                    BaseText.plain(text: appBarTitle.last, style: stt)
                  ],
                ),
                YBox(padding),
                BoxOutline(
                  size: Size(screenWidth, 224),
                  child: Container(
                    decoration: BoxDecoration(
                      color: appColors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox.fromSize(
                      size: Size(screenWidth, 224),
                    ),
                  ),
                ),

                // Video Player
                // VideoPlayerWidget(
                //   videoUrl: lesson.videoUrl.first,
                // ),
                SizedBox(height: 20),

                // Transcript

                // Quiz/Questions
                // LessonQuizWidget(lessonId: lesson.id),
                Spacer(),
                // Complete Button

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SignActionButton(
                      label: "Next Lesson",
                      onPressed: () {
                        ref.read(completeLessonProvider).call(lesson.id);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, stack) => Center(child: Text('Error loading lesson')),
        ),
      ),
    );
  }
}
