import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          textStyle: const TextStyle(fontSize: 50),
        ),
      )
          .animate(onPlay: (controller) => controller.repeat())
          .shake(
              hz: 4,
              curve: Curves.easeInOutCubic,
              delay: 2000.ms,
              duration: 1800.ms)
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.1, 1.1),
            duration: 600.ms,
          )
          .then(delay: 300.ms)
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(1 / 1.1, 1 / 1.1),
          ),
    );
  }

  Widget _buildGoToGamePageButton() {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () => context.go(gamePath),
          child: Text(
            'テトリス',
            style: GoogleFonts.dotGothic16(),
          ),
        );
      },
    );
  }

  Widget _buildRankingButton() {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () => context.push(rankingPath),
          child: Text('ランキング', style: GoogleFonts.dotGothic16()),
        );
      },
    );
  }
}
