import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router_path.dart';
import '../base/base.dart';
import 'home_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(
      appBar: BaseAppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await ref.watch(homeViewModelProvider).signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildText(),
        _buildGoToGamePageButton(),
        _buildRankingButton(),
      ],
    );
  }

  Widget _buildText() {
    return Center(
        child: Text(
      'TOEIC 対策',
      style: GoogleFonts.dotGothic16(
        textStyle: const TextStyle(fontSize: 40),
      ),
    ));
  }

  Widget _buildGoToGamePageButton() {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () => context.go(gamePath),
          child: const Text('テトリス'),
        );
      },
    );
  }

  Widget _buildRankingButton() {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () => context.go(rankingPath),
          child: const Text('ランキング'),
        );
      },
    );
  }
}
