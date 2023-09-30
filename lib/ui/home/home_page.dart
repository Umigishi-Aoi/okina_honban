import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/router/router_path.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/home/home_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
        appBar: BaseAppBar(actions: [
          IconButton(
            onPressed: () async {
              await ref.watch(homeViewModelProvider).signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ]),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildText(),
        _buildStartButton(),
        _buildRankingButton(context),
      ],
    );
  }

  Widget _buildText() {
    return const Center(child: Text('TOEIC 対策'));
  }

  Widget _buildStartButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('スタート'),
    );
  }

  Widget _buildRankingButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(rankingPath);
      },
      child: const Text('ランキング'),
    );
  }
}
