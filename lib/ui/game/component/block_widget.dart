import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/game/model/block.dart';

class BlockWidget extends HookConsumerWidget {
  const BlockWidget({super.key, required this.block, required this.length});

  final Block block;
  final double length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return block.color == null
        ? _buildNoColorBox()
        : _buildColoredBox(block.color);
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
