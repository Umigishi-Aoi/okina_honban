import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Center(
      child: Text(
        'スコアランキング',
        style: GoogleFonts.dotGothic16(
          textStyle: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }

  Widget _buildRankingList(List<TetoeicUser> users) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _buildRankingBuilder(
            users,
            constraints.maxWidth * 0.8,
          );
        } else {
          return _buildRankingBuilder(users, 500);
        }
      },
    );
  }

  Widget _buildRankingBuilder(List<TetoeicUser> users, double width) {
    return HookConsumer(
      builder: (context, ref, __) {
        return Container(
          height: 400,
          width: width,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              if (index == 0) {
                return Card(
                  color: const Color.fromARGB(255, 228, 216, 87),
                  child: ListTile(
                    leading: Text(
                      '${index + 1}.',
                      style: GoogleFonts.dotGothic16(),
                    ),
                    title: Text(
                      user.name,
                      style: GoogleFonts.dotGothic16(),
                    ),
                    trailing: Text(
                      '${user.score}',
                      style: GoogleFonts.dotGothic16(),
                    ),
                  ),
                );
              } else if (index == 1) {
                return Card(
                  color: const Color.fromARGB(255, 210, 206, 206),
                  child: ListTile(
                    leading: Text(
                      '${index + 1}.',
                      style: GoogleFonts.dotGothic16(),
                    ),
                    title: Text(
                      user.name,
                      style: GoogleFonts.dotGothic16(),
                    ),
                    trailing: Text(
                      '${user.score}',
                      style: GoogleFonts.dotGothic16(),
                    ),
                  ),
                );
              } else if (index == 2) {
                return Card(
                  color: const Color.fromARGB(255, 195, 100, 66),
                  child: ListTile(
                    leading: Text(
                      '${index + 1}.',
                      style: GoogleFonts.dotGothic16(),
                    ),
                    title: Text(
                      user.name,
                      style: GoogleFonts.dotGothic16(),
                    ),
                    trailing: Text(
                      '${user.score}',
                      style: GoogleFonts.dotGothic16(),
                    ),
                  ),
                );
              } else {
                return Card(
                  child: ListTile(
                    leading: Text(
                      '${index + 1}.',
                      style: GoogleFonts.dotGothic16(),
                    ),
                    title: Text(
                      user.name,
                      style: GoogleFonts.dotGothic16(),
                    ),
                    trailing: Text(
                      '${user.score}',
                      style: GoogleFonts.dotGothic16(),
                    ),
                  ),
                );
              }
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
          child: Text('戻る', style: GoogleFonts.dotGothic16()),
        );
      },
    );
  }
}
