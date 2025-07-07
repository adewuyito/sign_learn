import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/shared/presentation/linear_progress_bar.dart';

import '../../../../core/core.dart';
import '../../../shared/shared.dart';
import '../providers/quiz_option_provider.dart';
import 'lesson_navigation_button.dart';
import 'options_widget.dart';

@RoutePage()
class SignQuizVideoOptionView extends ConsumerStatefulWidget {
  const SignQuizVideoOptionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignQuizeOptionViewState();
}

class _SignQuizeOptionViewState extends ConsumerState<SignQuizVideoOptionView> {
  @override
  Widget build(BuildContext context) {
    var boolOptions = ref.watch(quizOptionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: SignLinearProgressBar(progress: 0.1),
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VideoWidget(lessonVideo: ''), //~ Video Player  
              const SizedBox(height: 32),
              OptionWidget(boolOptions: boolOptions), // ~ Options widget
              LessonsNavigationButton(boolOptions: boolOptions),
            ],
          ),
        ),
      ),
    );
  }
}

Widget projectTitle = Column();
