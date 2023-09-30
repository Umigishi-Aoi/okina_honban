import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/model/t_box.dart';

class TBoxWidget extends HookConsumerWidget {
  const TBoxWidget(this.tBox, {super.key});

  final TBox tBox;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return tBox.color == null
        ? _buildNoColorBox()
        : _buildColoredBox(tBox.color!);
  }

  Widget _buildNoColorBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.black,
      ),
    );
  }

  Widget _buildColoredBox(Color color) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        color: color,
      ),
    );
  }
}
