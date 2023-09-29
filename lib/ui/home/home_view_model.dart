import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';

import '../../data/repository/repository.dart';

final homeViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomeViewModel(ref));

class HomeViewModel extends BaseViewModel {
  HomeViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signOut() async => await callFuture<void>(
        () async => await _supabaseRepository.signOut(),
      );
}
