import 'package:freezed_annotation/freezed_annotation.dart';

part 'tetoiec_user.freezed.dart';
part 'tetoiec_user.g.dart';

@freezed
class TetoiecUser with _$TetoiecUser {
  const factory TetoiecUser({
    @Default('') String name,
    @Default('') String id,
    DateTime? updatedAt,
    @Default(0) int score,
  }) = _TetoiecUser;

  factory TetoiecUser.fromJson(Map<String, dynamic> json) =>
      _$TetoiecUserFromJson(json);
  TetoiecUser._();
}
