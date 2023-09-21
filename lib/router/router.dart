import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okina_honban/router/router_path.dart';
import 'package:okina_honban/ui/pokemon/pokemon_view.dart';

import '../ui/home/home_page.dart';

final router = GoRouter(
  initialLocation: homePath,
  routes: [
    GoRoute(
      path: homePath,
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
    ),
    GoRoute(
      path: pokemonPath,
      pageBuilder: (context, state) => const MaterialPage(child: PokemonPage()),
    ),
  ],
);