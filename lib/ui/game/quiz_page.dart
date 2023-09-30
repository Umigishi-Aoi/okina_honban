import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/quiz_view_model.dart';

import '../../gen/assets.gen.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuestion(),
        _buildAnswerField(),
      ],
    );
  }

  Widget _buildQuestion() {
    return HookConsumer(builder: (context, ref, child) {
      final question =
          ref.watch(quizViewModelProvider.select((value) => value.question));
      return question != null
          ? Text(question,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ))
          : const SizedBox();
    });
  }

  Widget _buildAnswerField() {
    return HookConsumer(builder: (context, ref, child) {
      final textEditingController = useTextEditingController();
      return Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.black45.withOpacity(0.5),
        ),
        child: TextField(
          controller: textEditingController,
          textAlign: TextAlign.center,
          onSubmitted: (value) {
            final isCorrect = ref.read(quizViewModelProvider).answer == value;
            checkAnswer(isCorrect, context);
            textEditingController.clear();
          },
        ),
      );
    });
  }

  Future<void> checkAnswer(bool isCorrect, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return isCorrect
              ? Assets.images.quiz.maru.image()
              : Assets.images.quiz.batu.image();
        });
  }
}
