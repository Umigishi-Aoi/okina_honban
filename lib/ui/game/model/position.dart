import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';

@freezed
class Position with _$Position {
  const factory Position({
    required int x,
    required int y,
  }) = _Position;

  const Position._();

  Position operator +(Position other) {
    return Position(
      x: x + other.x,
      y: y + other.y,
    );
  }

  Position operator -(Position other) {
    return Position(
      x: x - other.x,
      y: y - other.y,
    );
  }
}
