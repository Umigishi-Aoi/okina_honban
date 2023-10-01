import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'block.freezed.dart';

@freezed
class Block with _$Block {
  const factory Block({
    @Default(Colors.black) Color color,
  }) = _Block;

  const Block._();
}
