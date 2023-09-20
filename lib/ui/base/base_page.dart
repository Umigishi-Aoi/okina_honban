import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base_app_bar.dart';
import 'package:okina_honban/ui/base/base_loading.dart';

import 'base_view_model.dart';

class BasePage extends HookConsumerWidget {
  const BasePage(
      {Key? key,
        required this.body,
        this.appBar,
        this.bottomNavigationBar,
        this.backgroundColor = Colors.white,
        this.floatingActionButton,
        this.loading,
        this.needShowLoading = true})
      : super(key: key);

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final Widget? floatingActionButton;
  final Widget? loading;
  final bool needShowLoading;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingStateProvider.notifier).state;
    return Scaffold(
      appBar: appBar ?? const BaseAppBar(),
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          body,
          loading ?? BaseLoading(isLoading && needShowLoading)
        ],
      ),
    );
  }

}