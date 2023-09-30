import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/model/quiz.dart';

import '../base/base_view_model.dart';
import 'game_const.dart';

final quizViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => QuizViewModel(ref));

class QuizViewModel extends BaseViewModel {
  QuizViewModel(super.ref) {
    createQuiz();
  }
  Quiz? _quiz;
  Quiz? get quiz => _quiz;

  String? get answer => _quiz?.english;

  String? get question => _quiz?.japanese;
  void createQuiz() {
    final toeicWord =
        toeicWords.entries.elementAt(Random().nextInt(toeicWords.length));
    _quiz = Quiz(
      english: toeicWord.key,
      japanese: toeicWord.value,
    );
    notifyListeners();
  }
}
