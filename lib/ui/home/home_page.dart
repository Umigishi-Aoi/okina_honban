import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';

import '../../router/router_path.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildGoToPokemonPage()],
    );
  }

  Widget _buildGoToPokemonPage() {
    return Builder(builder: (context) {
      return Center(
        child: ElevatedButton(
            onPressed: () {
              context.push(pokemonPath);
            },
            child: const Text('ポケモン')),
      );
    });
  }
}
