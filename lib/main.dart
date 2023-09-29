import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/data/repository/repository.dart';
import 'package:okina_honban/data/repository/supabase_repository_impl.dart';
import 'package:okina_honban/router/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'foundation/constants.dart';

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(routerProvider),
    );
  }
}
