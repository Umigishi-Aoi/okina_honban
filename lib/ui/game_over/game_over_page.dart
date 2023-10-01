import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../game/game_view_model.dart';

class GameOverPage extends HookConsumerWidget {
  const GameOverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    const youtubeUrl = 'https://www.youtube.com/';
    return HookConsumer(
      builder: (context, ref, __) {
        return LayoutBuilder(builder: (context, constraint) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.smart_toy,
                      color: Colors.red,
                      size: 100,
                    ),
                    Text(
                      'GAME OVER',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  'スコア',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),

                                /// TODO: supabaseに登録してから表示する？
                                Text(
                                  ref.watch(scoreProvider).toString(),
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                rowButtons(constraint.maxWidth, context),
                columnButtons(constraint.maxWidth, context),
              ],
            ),
          );
        });
      },
    );
  }

  Widget columnButtons(double maxWidth, BuildContext context) {
    return Visibility(
      visible: maxWidth < 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 16.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('もう一回遊ぶ'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 16.0,
            ),
            child: TextButton(
              onPressed: () {
                // TODO: ホームに戻る遷移処理を書く
              },
              child: const Text('ホームに戻る'),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowButtons(double maxWidth, BuildContext context) {
    return Visibility(
      visible: maxWidth > 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 16.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('もう一回遊ぶ'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 16.0,
            ),
            child: TextButton(
              onPressed: () {
                // TODO: ホームに戻る遷移処理を書く
              },
              child: const Text('ホームに戻る'),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
