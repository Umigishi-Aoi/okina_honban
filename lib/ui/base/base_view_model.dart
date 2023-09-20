import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/result.dart';

final baseViewModelProvider = ChangeNotifierProvider<BaseViewModel>((ref) {
  return BaseViewModel(ref);
});

final loadingStateProvider = StateProvider((ref) => false);

class BaseViewModel extends ChangeNotifier {
  BaseViewModel(this._ref);

  final Ref _ref;

  StateController<bool> get loadingState =>
      _ref.read(loadingStateProvider.notifier);

  bool get isLoading => loadingState.state;

  void toLoading() {
    if (isLoading) return;
    loadingState.state = true;
  }

  void toIdle() {
    if (!isLoading) return;
    loadingState.state = false;
  }

  Future<Result<T>> callFuture<T>(Future<T> Function() future,
      {bool isLoading = true}) {
    return Future.microtask(toLoading)
        .then((_) => Result.guardFuture(future))
        .whenComplete(toIdle);
  }
}
