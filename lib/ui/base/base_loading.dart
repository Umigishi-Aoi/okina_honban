import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseLoading extends HookConsumerWidget {
  const BaseLoading(this.isLoading,
      {Key? key,
      this.opacity = 0.3,
      this.modalBarrierColor = Colors.grey,
      this.indicator})
      : super(key: key);

  final bool isLoading;
  final double opacity;
  final Color modalBarrierColor;
  final Widget? indicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isLoading
        ? Stack(
            children: [
              Opacity(
                opacity: opacity,
                child:
                    ModalBarrier(dismissible: false, color: modalBarrierColor),
              ),
              indicator ?? const Center(child: CircularProgressIndicator()),
            ],
          )
        : const SizedBox();
  }
}
