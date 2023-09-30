import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/model/t_box.dart';

class TBoxWidget extends HookConsumerWidget {
  const TBoxWidget({super.key, required this.tBox, required this.length});

  final TBox tBox;
  final double length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return tBox.color == null
        ? _buildNoColorBox()
        : _buildColoredBox(tBox.color!);
  }

  Widget _buildNoColorBox() {
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.black,
      ),
    );
  }

  Widget _buildColoredBox(Color color) {
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        color: color,
      ),
    );
  }
}
