import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';

import '../../data/repository/repository.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => SignUpViewModel(ref));

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signUp(
          {required String email,
          required String password,
          required String userName}) async =>
      await callFuture<void>(
        () async => await _supabaseRepository.signUp(
          password: password,
          email: email,
          userName: userName,
        ),
      );
}
