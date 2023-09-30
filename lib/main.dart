import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/complete_game/game_over_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/repository/repository.dart';
import 'data/repository/supabase_repository_impl.dart';
import 'foundation/constants.dart';
import 'router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  runApp(
    ProviderScope(
      overrides: [
        supabaseRepositoryProvider.overrideWithValue(
          SupabaseRepositoryImpl(),
        ),
      ],
      // child: const MyApp(),
      child: const MaterialApp(home: GameOverPage()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerProvider),
    );
  }
}
