import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PageBackground extends StatefulWidget {
  const PageBackground({super.key});

  @override
  State<PageBackground> createState() => _StarsPageState();
}

class _StarsPageState extends State<PageBackground> {
  final game = Stars();

  @override
  void dispose() {
    game.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}

class Stars extends Game {
  late final ui.FragmentProgram _program;
  late final ui.FragmentShader shader;

  double time = 0;

  void dispose() {
    time = 0;
    shader.dispose();
  }

  @override
  Future<void>? onLoad() async {
    _program = await ui.FragmentProgram.fromAsset('shaders/game.glsl');
    shader = _program.fragmentShader();
  }

  @override
  void render(ui.Canvas canvas) {
    shader
      ..setFloat(0, size.x)
      ..setFloat(1, size.y)
      ..setFloat(2, time)
      ..setFloat(3, 0)
      ..setFloat(3, 0);

    canvas
      ..translate(size.x, size.y)
      ..rotate(180 * degrees2Radians)
      ..translate(size.x, 0)
      ..scale(-1, 1)
      ..drawRect(
        Offset.zero & size.toSize(),
        Paint()..shader = shader,
      );
  }

  @override
  void update(double dt) {
    time += dt * 0.01;
  }
}
