import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/repository.dart';
import '../base/base.dart';

final signInViewModelProvider =
    ChangeNotifierProvider.autoDispose(SignInViewModel.new);

class SignInViewModel extends BaseViewModel {
  SignInViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async =>
      callFuture<void>(
        () async => _supabaseRepository.signIn(
          password: password,
          email: email,
        ),
      );
}
