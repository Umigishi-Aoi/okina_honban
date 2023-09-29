import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/data/repository/repository.dart';
import 'package:okina_honban/ui/base/base.dart';

final signInViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => SignInViewModel(ref));

class SignInViewModel extends BaseViewModel {
  SignInViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async =>
      await callFuture<void>(
        () async => await _supabaseRepository.signIn(
          password: password,
          email: email,
        ),
      );
}
