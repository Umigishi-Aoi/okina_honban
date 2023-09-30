import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/home/home_view_model.dart';

import '../../router/router_path.dart';

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
        body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildText(), _buildGoToGamePageButton()],
    );
  }

  Widget _buildText() {
    return const Center(child: Text('ホーム'));
  }

  Widget _buildGoToGamePageButton() {
    return Builder(builder: (context) {
      return ElevatedButton(
        onPressed: () => context.go(gamePath),
        child: const Text('テトリス'),
      );
    });
  }
}
