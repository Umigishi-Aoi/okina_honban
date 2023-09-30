import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as r;
import 'package:okina_honban/router/router_path.dart';
import 'package:okina_honban/ui/ranking/ranking_page.dart';
import 'package:okina_honban/ui/sign_in/sign_in_page.dart';
import 'package:okina_honban/ui/sign_up/sign_up_page.dart';

import '../data/repository/repository.dart';
import '../ui/home/home_page.dart';

final routerProvider = r.Provider((ref) {
  final authState = ref.watch(supabaseRepositoryProvider).authState;
  return GoRouter(
    initialLocation: homePath,
    redirect: (_, state) async {
      String? path = homePath;
      bool isSignIn = ref.read(supabaseRepositoryProvider).currentUser != null;
      String currentPath = state.matchedLocation;

      if (!isSignIn) {
        if (currentPath == signUpPath) {
          path = signUpPath;
        } else {
          path = signInPath;
        }
      }
      log('path=$path');
      return path;
    },
    refreshListenable: GoRouterRefreshStream(authState),
    routes: [
      // INSERT ROUTE HERE

      GoRoute(
        path: signUpPath,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignUpPage()),
      ),
      GoRoute(
        path: signInPath,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignInPage()),
      ),
      GoRoute(
        path: homePath,
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: rankingPath,
        pageBuilder: (context, state) =>
            const MaterialPage(child: RankingPage()),
      )
    ],
  );
});

/// Streamの変化を検知するためのクラス
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) {
        log('notifyListeners');
        notifyListeners();
      },
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
