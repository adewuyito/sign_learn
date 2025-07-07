// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import "package:sign_learn/features/lessons/data/models/fake_model_lesson.dart";
import 'package:sign_learn/features/lessons/domain/domain.dart';
import 'package:sign_learn/features/profile/profile.dart';

import '../../../common/commons.dart';
import '../../../core/core.dart';
import '../../../gen/fonts.gen.dart';
import '../../../routes/router.dart';
import '../../lessons/data/data.dart';
import 'widgets/home_calender.dart';
import 'widgets/module_buttons.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userName = ref.watch(userNotiferProvider).displayName;
    final fullname = userName ?? "Welcome Back";
    final _widgetSize = Size(Dims.availableWidth, 141.dy);
    final tt = Theme.of(context).textTheme;

    return SafeArea(
      minimum: safeAreaPadding,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          // onPressed: () async {
          // },
          // onPressed: () => SignNavigator.of(context).push(
          //   GptLessonListRoute(levelId: 'asl_lesson1', unitId: 'unit1'),
          // ),
          // onPressed: () => SignNavigator.of(context).push(LessonRoute(
          //   lessonId: '1',
          //   clipUrls: [
          //     'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          //     'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          //     'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
          //   ],
          // )),
          onPressed: () => SignNavigator.of(context).push(
            LessonListWidget(
              course: 'ASL1',
              unit: 'unit1',
              lessons: ['lesson1', 'lesson2', 'lesson3', 'lesson4', 'lesson5'],
            ),
          ),
          // onPressed: () => SignNavigator.of(context).push(SignQuizVideoOptionRoute()),
          // onPressed: () => SignNavigator.of(context).push(SignQuizRoute()),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () async {
        //   // debugPrint("User Profile ==> ${ref.watch(userNotiferProvider)}");
        //   // debugPrint("User Profile ==> ${ref.watch(authNotifierProvider)}");

        //   final lessonLocks = ref.watch(lessonLocksProvider);
        //   await ref.read(lessonLocksProvider.notifier).unlockLesson(3);

        //   debugPrint("Lesson lock ${lessonLocks}");
        //   // SignNavigator.of(context).push(SignQuizRoute());
        // }),
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              ProfileImage(size: Size.square(32)),
              XBox(padding),
              RichTextWidget(
                styleForAll: TextStyle(color: appColors.black),
                texts: [
                  BaseText.plain(
                    text: "Hello, ",
                    style: tt.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.satoshi,
                    ),
                  ),
                  BaseText(
                    text: fullname,
                    style: tt.headlineMedium!.copyWith(
                      fontFamily: FontFamily.clashDisplay,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YBox(.2.dyPercent),
            StreakWeekCalander(size: _widgetSize),
            YBox(.05.dyPercent),
            Text(
              "Learning Units",
              style: tt.headlineMedium!.copyWith(
                fontFamily: FontFamily.satoshi,
                fontWeight: FontWeight.bold,
              ),
            ),
            YBox(padding.dy),
            ModuleButtons(),
            UploadMockLessonsButton(),
          ],
        ),
      ),
    );
  }
}

class UploadMockLessonsButton extends ConsumerStatefulWidget {
  const UploadMockLessonsButton({super.key});

  @override
  ConsumerState<UploadMockLessonsButton> createState() =>
      _UploadMockLessonsButtonState();
}

class _UploadMockLessonsButtonState
    extends ConsumerState<UploadMockLessonsButton> {
  bool _isUploading = false;

  Future<void> _upload() async {
    if (_isUploading) return;
    setState(() => _isUploading = true);

    const levelId = 'asl_lesson1';
    const unitId = 'unit2';

    try {
      final ILessonRemoteSource remote = ref.read(lessonRemoteSourceProvider);

      // Iterate the Dart list and push each lesson
      for (final LessonModel lesson in kMockLessonsUnit1) {
        await remote.upsertLesson(
          levelId: levelId,
          unitId: unitId,
          lesson: lesson,
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mock lessons uploaded successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: _isUploading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.cloud_upload),
      label: Text(_isUploading ? 'Uploading…' : 'Upload Mock Lessons'),
      onPressed: _isUploading ? null : _upload,
      style: ElevatedButton.styleFrom(minimumSize: const Size(220, 48)),
    );
  }
}
