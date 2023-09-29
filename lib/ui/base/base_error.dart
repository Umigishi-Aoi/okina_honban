import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/data/model/model.dart';
import 'package:okina_honban/ui/base/base.dart';

class BaseError<T> extends HookConsumerWidget {
  const BaseError(
    this.failure, {
    super.key,
    required this.needShowError,
    this.opacity = 0.3,
    this.modalBarrierColor = Colors.grey,
  });

  final Failure<T>? failure;
  final bool needShowError;
  final double opacity;
  final Color modalBarrierColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final containerBaseSize =
        deviceHeight >= deviceWidth ? deviceWidth : deviceHeight;
    final containerSize = containerBaseSize * 0.8;
    final verticalPadding = containerSize * 0.1;

    return Stack(
      children: [
        if (failure != null && needShowError)
          Stack(
            children: [
              Opacity(
                opacity: opacity,
                child:
                    ModalBarrier(dismissible: false, color: modalBarrierColor),
              ),
              Center(
                child: Container(
                  height: containerSize,
                  width: containerSize,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(failure!.data?.toString() ?? 'Unknown Error'),
                      SizedBox(height: verticalPadding),
                      ElevatedButton(
                        onPressed: () =>
                            ref.read(errorStateProvider.notifier).state = null,
                        child: const Text('OK'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
