import 'package:hooks_riverpod/hooks_riverpod.dart' as r;
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseRepositoryProvider =
    r.Provider<SupabaseRepository>((ref) => throw UnimplementedError());

abstract class SupabaseRepository {
  User? get currentUser;

  Stream<AuthState> get authState;

  Future<void> signIn({
    required String password,
    required String email,
  }) async {}

  Future<void> signOut() async {}

  Future<void> signUp({
    required String password,
    required String email,
    required String userName,
  }) async {}
}
