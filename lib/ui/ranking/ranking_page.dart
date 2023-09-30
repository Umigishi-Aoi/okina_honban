import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/ranking/ranking_view_model.dart';

import '../../data/model/tetoeic_user/tetoeic_user.dart';
import '../../router/router_path.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    return HookConsumer(
      builder: (context, ref, __) {
        final isLoading = ref.watch(loadingStateProvider.notifier).state;
        final users =
            ref.watch(rankingViewModelProvider.select((value) => value.users));
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isLoading && users != null) ...[
              _buildText(),
              _buildRankingList(users),
              _buildBackButton(),
            ]
          ],
        );
      },
    );
  }

  Widget _buildText() {
    return const Center(child: Text('ランキング'));
  }

  Widget _buildRankingList(List<TetoeicUser> users) {
    return HookConsumer(
      builder: (context, ref, __) {
        return Container(
          height: 400,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                child: ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(user.name),
                  trailing: Text('${user.score}'),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBackButton() {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () => context.go(homePath),
          child: const Text('戻る'),
        );
      },
    );
  }
}
