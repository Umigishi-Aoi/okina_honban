import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'block.freezed.dart';

@freezed
class Block with _$Block {
  const factory Block({
    Color? color,
  }) = _Block;

  const Block._();
}
