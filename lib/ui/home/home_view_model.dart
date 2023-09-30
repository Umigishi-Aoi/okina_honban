import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/repository.dart';
import '../base/base.dart';

final homeViewModelProvider =
    ChangeNotifierProvider.autoDispose(HomeViewModel.new);

class HomeViewModel extends BaseViewModel {
  HomeViewModel(super.ref)
      : _supabaseRepository =
            ref.watch<SupabaseRepository>(supabaseRepositoryProvider);

  final SupabaseRepository _supabaseRepository;

  Future<void> signOut() async => callFuture<void>(
        () async => _supabaseRepository.signOut(),
      );
}
