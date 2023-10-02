import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base_app_bar.dart';
import 'package:okina_honban/ui/base/base_loading.dart';

import 'base_error.dart';
import 'base_view_model.dart';

class BasePage extends HookConsumerWidget {
  const BasePage({
    Key? key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
    this.floatingActionButton,
    this.loading,
    this.error,
    this.needShowLoading = true,
    this.needShowError = true,
    this.needAppBar = true,
    this.backgroundWidget,
  }) : super(key: key);

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final Widget? floatingActionButton;
  final Widget? loading;
  final Widget? error;
  final bool needShowLoading;
  final bool needShowError;
  final bool needAppBar;
  final Widget? backgroundWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingStateProvider);
    final failure = ref.watch(errorStateProvider);
    return Scaffold(
      appBar: needAppBar ? appBar ?? const BaseAppBar() : null,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          if (backgroundWidget != null) backgroundWidget!,
          if (!isLoading) body,
          loading ??
              BaseLoading(
                isLoading && needShowLoading,
              ),
          error ??
              BaseError(
                failure,
                needShowError: needShowError,
              ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
