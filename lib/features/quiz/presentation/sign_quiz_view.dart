import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../../routes/router.dart';
import '../../shared/presentation/linear_progress_bar.dart';

@RoutePage()
class SignQuizView extends ConsumerStatefulWidget {
  const SignQuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignQuizeViewState();
}

class _SignQuizeViewState extends ConsumerState<SignQuizView> {
  @override
  Widget build(BuildContext context) {
    var boolOptions = ref.watch(quizOptionNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ref.read(quizOptionNotifierProvider.notifier).refreshState();
            SignNavigator.of(context).pop();
          },
        ),
        title: SignLinearProgressBar(progress: 0.5),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding.dx),
            child: Icon(
              Icons.heart_broken,
              color: appColors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        minimum: safeAreaPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What does the word sign?'),
            Text('Again'),
            YBox(24.dy),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(quizOptionNotifierProvider.notifier)
                          .toggleOption(index);
                    },
                    child: Stack(children: [
                      Container(
                        width: 1.dxPercent / 2,
                        height: 650,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColors.black,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Positioned(
                        child: Radio<bool>(
                          value: true,
                          groupValue: boolOptions[index],
                          onChanged: (value) {},
                        ),
                      )
                    ]),
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizOptionNotifier extends Notifier<List<bool>> {
  @override
  List<bool> build() {
    return [false, false, false, false];
  }

  void refreshState() {
    state = [false, false, false, false];
  }

  void toggleOption(int index) {
    if (state[index] == false) {
      var _newState = [false, false, false, false];
      _newState[index] = true;
      state = _newState;
    }
  }
}

final quizOptionNotifierProvider =
    NotifierProvider<QuizOptionNotifier, List<bool>>(QuizOptionNotifier.new);
