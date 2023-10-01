import 'package:flutter/material.dart';

/// 左ボタン
Widget leftButtonWidget(Function function) {
  return IconButton(
      onPressed: () {
        function();
      },
      icon: const Icon(
        Icons.arrow_circle_left,
      ));
}

/// 下ボタン
Widget downButtonWidget(Function function) {
  return IconButton(
      onPressed: () {
        function();
      },
      icon: const Icon(
        Icons.arrow_circle_down,
      ));
}

/// 右ボタン
Widget rightButtonWidget(Function function) {
  return IconButton(
      onPressed: () {
        function();
      },
      icon: const Icon(
        Icons.arrow_circle_right,
      ));
}

/// 回転ボタン
Widget rotateButtonWidget(Function function) {
  return IconButton(
      onPressed: () {
        function();
      },
      icon: const Icon(
        Icons.rotate_90_degrees_cw,
      ));
}
