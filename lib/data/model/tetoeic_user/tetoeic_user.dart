import 'package:freezed_annotation/freezed_annotation.dart';

part 'tetoeic_user.freezed.dart';
part 'tetoeic_user.g.dart';

@freezed
class TetoeicUser with _$TetoeicUser {
  const factory TetoeicUser({
    @Default('') String name,
    @Default('') String id,
    DateTime? updatedAt,
    @Default(0) int score,
  }) = _TetoeicUser;

  factory TetoeicUser.fromJson(Map<String, dynamic> json) =>
      _$TetoeicUserFromJson(json);
  TetoeicUser._();
}
