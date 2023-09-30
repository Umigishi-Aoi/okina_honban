import 'package:okina_honban/data/model/tetoeic_user/tetoeic_user.dart';
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
    required String userName,
  }) async {
    await _supabaseClient.auth.signUp(
      password: password,
      email: email,
      data: {'username': userName},
    );
  }

  @override
  Future<void> setScore({required TetoeicUser user}) async {}

  @override
  Future<void> getScores() async {}
}
