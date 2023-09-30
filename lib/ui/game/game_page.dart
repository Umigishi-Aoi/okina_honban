import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/component/block_widget.dart';
import 'package:okina_honban/ui/game/game_const.dart';

import 'game_view_model.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildMainBox(),
      ],
    );
  }

  Widget _buildMainBox() {
    return HookConsumer(builder: (context, ref, child) {
      final wPadding = MediaQuery.of(context).size.width * 0.1;
      final height = MediaQuery.of(context).size.height * 0.8;
      return Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: wPadding),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTBoxes(),
            ],
          ));
    });
  }

  Widget _buildTBoxes() {
    return HookConsumer(builder: (context, ref, child) {
      final tBoxesFlatten = ref
          .watch(gameViewModelProvider.select((value) => value.tBoxesFlatten));
      final length = MediaQuery.of(context).size.height * 0.8 / hNum;
      return Expanded(
        child: GridView.count(
            crossAxisCount: wNum,
            children: tBoxesFlatten
                .map((tBox) => TBoxWidget(
                      block: tBox,
                      length: length,
                    ))
                .toList()),
      );
    });
  }
}
