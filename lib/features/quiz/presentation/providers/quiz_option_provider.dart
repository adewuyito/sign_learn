import 'package:hooks_riverpod/hooks_riverpod.dart';

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
