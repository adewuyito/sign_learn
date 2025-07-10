// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import "../../lessons/data/models/fake_model_lesson.dart";
import '../../../common/commons.dart';
import '../../../core/core.dart';
import '../../../gen/fonts.gen.dart';
import '../../../routes/router.dart';
import '../../lessons/data/data.dart';
import '../../profile/profile.dart';
import '../../quiz/presentation/quiz_score_view.dart';
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
          onPressed: () async {
            //   final firebase = FirebaseStorage.instance;

            //  final imageUrl = await firebase.ref('/quiz/images/image_1.jpg').getDownloadURL();

            //   debugPrint(imageUrl);

            SignNavigator.of(context).push(QuizDetailRoute(
              levelId: "asl_lesson1",
              unitId: 'unit1',
              lessonId: 'lesson_1',
            ));

            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const ExampleMultiChoiceView(),
            //   ),
            // );
          },

          /* onPressed: () async {
            // Example level/unit IDs; adjust as needed
            const levelId = 'asl_lesson1';
            const unitId = 'unit1';

            try {
              await uploadMockQuizzes(levelId: levelId, unitId: unitId, ref: ref);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mock quizzes uploaded!')),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Upload failed: $e')),
                );
              }
            }
          },
 */
        ),

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
            // UploadMockLessonsButton(),

            // Test Quiz Score Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to a sample quiz score view
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizScoreView(
                        levelId: "asl_lesson1",
                        unitId: "unit1",
                        lessonId: "lesson_1",
                        quizTitle: "Sample Quiz - ASL Basics",
                        totalQuestions: 10,
                        correctAnswers: 7,
                        incorrectAnswers: 2,
                        skippedQuestions: 1,
                        questionResults: [
                          QuizQuestionResult(isCorrect: true, correctOption: 0),
                          QuizQuestionResult(
                              isCorrect: false,
                              selectedOption: 1,
                              correctOption: 2),
                          QuizQuestionResult(isCorrect: true, correctOption: 1),
                          QuizQuestionResult(isCorrect: true, correctOption: 3),
                          QuizQuestionResult(
                              isCorrect: false,
                              selectedOption: 0,
                              correctOption: 1),
                          QuizQuestionResult(isCorrect: true, correctOption: 2),
                          QuizQuestionResult(isCorrect: true, correctOption: 0),
                          QuizQuestionResult(isCorrect: true, correctOption: 1),
                          QuizQuestionResult(isCorrect: true, correctOption: 3),
                          QuizQuestionResult(
                              isCorrect: false,
                              selectedOption: null,
                              correctOption: 2),
                        ],
                        timeTaken: const Duration(minutes: 5, seconds: 30),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.analytics),
                label: const Text('View Sample Quiz Score'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
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
