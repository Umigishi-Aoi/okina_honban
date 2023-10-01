import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/foundation/audio_player_helper.dart';
import 'package:okina_honban/ui/game/component/block_widget.dart';
import 'package:okina_honban/ui/game/component/preview_mino.dart';
import 'package:okina_honban/ui/game/game_background.dart';
import 'package:okina_honban/ui/game/game_const.dart';

import 'game_view_model.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      AudioPlayerHelper().play(Bgm.palying.name);
      return null;
    }, null);

    return WillPopScope(
      onWillPop: () async {
        AudioPlayerHelper().pause();
        return true;
      },
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        const GameBackground(),
        Column(
          children: [
            _buildMainBox(),
            _buildButtons(),
          ],
        ),
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
      final length = MediaQuery.of(context).size.height * 0.8 / kHNum;
      return Expanded(
        child: GridView.count(
            crossAxisCount: kWNum,
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
      final length = MediaQuery.of(context).size.height * 0.8 / kHNum;
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

  Widget _buildButtons() {
    return HookConsumer(
      builder: (_, ref, __) {
        final notifier = ref.watch(gameViewModelProvider.notifier);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _leftButtonWidget(notifier.goLeft),
                    _rightButtonWidget(notifier.goRight),
                  ],
                ),
                _downButtonWidget(notifier.goDown),
              ],
            ),
            _rotateButtonWidget(notifier.setMinoDirection),
          ],
        );
      },
    );
  }

  /// 左ボタン
  Widget _leftButtonWidget(Function function) {
    return IconButton(
      onPressed: () {
        function();
      },
      icon: const Icon(
        Icons.arrow_circle_left,
        color: Colors.white,
      ),
      iconSize: 60,
    );
  }

  /// 下ボタン
  Widget _downButtonWidget(Function function) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.all(0)), // 内部パディングを0に設定
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder?>(
              const CircleBorder(),
            ),
          ),
          onPressed: () {
            function();
          },
          child: const Icon(
            Icons.arrow_downward,
            color: Colors.black,
          )),
    );
  }

  /// 右ボタン
  Widget _rightButtonWidget(Function function) {
    return IconButton(
        onPressed: () {
          function();
        },
        iconSize: 60,
        icon: const Icon(
          Icons.arrow_circle_right,
          color: Colors.white,
        ));
  }

  /// 回転ボタン
  Widget _rotateButtonWidget(Function function) {
    return SizedBox(
      height: 60,
      width: 60,
      child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          child: const Icon(
            Icons.rotate_90_degrees_cw,
            color: Colors.black,
          )),
    );
  }
}
