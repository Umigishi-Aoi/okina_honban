import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/result.dart';

final baseViewModelProvider = ChangeNotifierProvider<BaseViewModel>((ref) {
  return BaseViewModel(ref);
});

final loadingStateProvider = StateProvider((ref) => false);

final errorStateProvider = StateProvider<Failure<Object?>?>((ref) => null);

class BaseViewModel extends ChangeNotifier {
  BaseViewModel(this.ref);

  final Ref ref;

  StateController<bool> get loadingState =>
      ref.read(loadingStateProvider.notifier);

  bool get isLoading => loadingState.state;

  void toLoading() {
    if (isLoading) return;
    loadingState.state = true;
  }

  void toIdle() {
    if (!isLoading) return;
    loadingState.state = false;
  }

  Future<void> callFuture<T>(Future<T> Function() future,
      {bool isLoading = true}) async {
    final result = await Future.microtask(toLoading)
        .then((_) => Result.guardFuture(future))
        .whenComplete(toIdle);

    if (result is Failure<T>) {
      ref.read(errorStateProvider.notifier).state = result;
      notifyListeners();
    }
  }
}
