import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/foundation/audio_player_helper.dart';
import 'package:okina_honban/ui/game/component/block_widget.dart';
import 'package:okina_honban/ui/game/component/preview_mino.dart';
import 'package:okina_honban/ui/game/game_const.dart';

import 'game_view_model.dart';

class GamePage extends StatefulHookConsumerWidget {
  const GamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  @override
  void initState() {
    AudioPlayerHelper().play(Bgm.palying.name);
    super.initState();
  }

  @override
  void dispose() {
    AudioPlayerHelper().pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: [
        _buildMainBox(),
        _buildButtons(),
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
                    ElevatedButton(
                      onPressed: notifier.goLeft,
                      child: const Text('←'),
                    ),
                    ElevatedButton(
                      onPressed: notifier.goRight,
                      child: const Text('→'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: notifier.goDown,
                  child: const Text('↓'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => notifier.setMinoDirection(),
              child: const Text('Rotate'),
            ),
          ],
        );
      },
    );
  }
}
