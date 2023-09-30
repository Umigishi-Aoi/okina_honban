import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/repository.dart';
import '../base/base.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider.autoDispose(SignUpViewModel.new);

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signUp({
    required String email,
    required String password,
    required String userName,
  }) async =>
      callFuture<void>(
        () async => _supabaseRepository.signUp(
          password: password,
          email: email,
          userName: userName,
        ),
      );
}
