import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/foundation/audio_player_helper.dart';

import '../../router/router_path.dart';
import '../page_background/page_background.dart';
import 'home_view_model.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    AudioPlayerHelper().play(Bgm.opening.name);
    super.initState();
  }

  @override
  void dispose() {
    AudioPlayerHelper().pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        const PageBackground(),
        LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildText(),
                _buildGoToGamePageButton(),
                _buildRankingButton(),
                _buildLogOutButton()
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildText(),
              _buildGoToGamePageButton(),
              _buildRankingButton(),
              _buildLogOutButton(),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildText() {
    return Center(
      child: Text(
        'TeTOEIC',
        style: GoogleFonts.dotGothic16(
          textStyle: const TextStyle(
              fontSize: 60, fontWeight: FontWeight.w700, color: Colors.white),
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
        return SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: () => context.go(gamePath),
            child: Text(
              'テトリス',
              style: GoogleFonts.dotGothic16(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRankingButton() {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: () => context.push(rankingPath),
            child: Text(
              'ランキング',
              style: GoogleFonts.dotGothic16(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogOutButton() {
    return SizedBox(
      width: 150,
      height: 30,
      child: ElevatedButton(
        onPressed: () async {
          await ref.watch(homeViewModelProvider).signOut();
        },
        child: const Text('ログアウト'),
      ),
    );
  }
}
