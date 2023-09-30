import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okina_honban/ui/game/model/position.dart';

part 'block.freezed.dart';

@freezed
class Block with _$Block {
  const factory Block({
    Color? color,
    required Position position,
  }) = _Block;

  const Block._();
}
