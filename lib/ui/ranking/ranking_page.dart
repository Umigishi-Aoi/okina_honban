import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router_path.dart';
import '../base/base_page.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    return HookConsumer(
      builder: (context, ref, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildText(),
            _buildRankingList(),
            _buildBackButton(),
          ],
        );
      },
    );
  }

  Widget _buildText() {
    return const Center(child: Text('ランキング'));
  }

  Widget _buildRankingList() {
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
          return Card(
            child: ListTile(
              leading: Text('${index + 1}'),
              title: const Text('User_Name'),
              trailing: const Text('Score'),
            ),
          );
        },
      ),
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
