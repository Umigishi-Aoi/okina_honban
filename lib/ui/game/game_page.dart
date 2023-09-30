import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/component/block_widget.dart';
import 'package:okina_honban/ui/game/component/next_mino.dart';
import 'package:okina_honban/ui/game/game_const.dart';

import 'game_view_model.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: SafeArea(child: _buildBody()));
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
      final height = MediaQuery.of(context).size.height * 0.8;
      return Container(
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: Row(
            children: [
              _buildBlocks(),
              Column(
                children: [
                  _buildNextMinoPreview(),
                  const Spacer(),
                ],
              )
            ],
          ));
    });
  }

  Widget _buildBlocks() {
    return HookConsumer(builder: (context, ref, child) {
      final blocks =
          ref.watch(gameViewModelProvider.select((value) => value.blocks));
      final length = MediaQuery.of(context).size.height * 0.8 / hNum;
      return Expanded(
        child: GridView.count(
            crossAxisCount: wNum,
            children: blocks
                .map((block) => BlockWidget(
                      block: block,
                      length: length,
                    ))
                .toList()),
      );
    });
  }

  Widget _buildNextMinoPreview() {
    return HookConsumer(builder: (context, ref, child) {
      final nextMino =
          ref.watch(gameViewModelProvider.select((value) => value.nextMino));
      final length = MediaQuery.of(context).size.height * 0.8 / hNum;
      return Container(
          width: length * 4,
          height: length * 2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 4),
            color: Colors.black,
          ),
          child:
              Center(child: PreviewMino(tetroMino: nextMino, length: length)));
    });
  }
}
