import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okina_honban/ui/game/model/position.dart';

part 't_box.freezed.dart';

@freezed
class TBox with _$TBox {
  const factory TBox({
    Color? color,
    required Position position,
}) = _TBox;

const TBox._();

}