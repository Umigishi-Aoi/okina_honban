import 'package:okina_honban/data/repository/supabase_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepositoryImpl extends SupabaseRepository {
  SupabaseRepositoryImpl() {
    _supabaseClient = Supabase.instance.client;
  }

  late final SupabaseClient _supabaseClient;

  @override
  User? get currentUser => _supabaseClient.auth.currentUser;

  @override
  Stream<AuthState> get authState => _supabaseClient.auth.onAuthStateChange;

  @override
  Future<void> signIn({
    required String password,
    required String email,
  }) async {
    await _supabaseClient.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  @override
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  @override
  Future<void> signUp({
    required String password,
    required String email,
  }) async {
    await _supabaseClient.auth.signUp(
      password: password,
      email: email,
    );
  }
}