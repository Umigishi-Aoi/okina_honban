import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:url_launcher/url_launcher.dart';

class CompleteGamePage extends HookConsumerWidget {
  const CompleteGamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    const youtubeUrl = 'https://www.youtube.com/';
    return HookConsumer(
      builder: (context, ref, __) {
        return LayoutBuilder(builder: (context, constraint) {
          bool visible = false;
          if (constraint.maxWidth > 600) {
            visible = true;
          } else {
            visible = false;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                    Text(
                      'Mission Complete!!',
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
                                Text(
                                  '100',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),

                          /// TODO: 名前をsupabaseから取ってきて表示する
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  'ランク',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),

                                /// TODO: supabaseに登録してから表示する？
                                Text(
                                  'S+',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-YgNJiTuKTA3j21SBKYfg6AyulClIsHNhiQ&usqp=CAU',
                              width: 100,
                              height: 100,
                            ),
                          ),

                          Visibility(
                            visible: youtubeUrl.isNotEmpty,
                            child: Container(
                              width: constraint.maxWidth / 3,
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: () => _launchURL(youtubeUrl),
                                child: const Text(youtubeUrl),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // TODO: 画像はsupabaseで用意しているものをランク別に表示する
                rowButtons(constraint.maxWidth, context),
                columnButtons(constraint.maxWidth, context),
              ],
            ),
          );
        });
      },
    );
  }

  Widget rowButtons(double maxWidth, BuildContext context) {
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

  Widget columnButtons(double maxWidth, BuildContext context) {
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
            child: TextButton(
              onPressed: () {
                // TODO: ホームに戻る遷移処理を書く
              },
              child: const Text('ホームに戻る'),
            ),
          ),
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
