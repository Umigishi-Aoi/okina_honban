// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetoeic_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TetoeicUser _$TetoeicUserFromJson(Map<String, dynamic> json) {
  return _TetoeicUser.fromJson(json);
}

/// @nodoc
mixin _$TetoeicUser {
  String get name => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TetoeicUserCopyWith<TetoeicUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TetoeicUserCopyWith<$Res> {
  factory $TetoeicUserCopyWith(
          TetoeicUser value, $Res Function(TetoeicUser) then) =
      _$TetoeicUserCopyWithImpl<$Res, TetoeicUser>;
  @useResult
  $Res call({String name, DateTime? updatedAt, int score});
}

/// @nodoc
class _$TetoeicUserCopyWithImpl<$Res, $Val extends TetoeicUser>
    implements $TetoeicUserCopyWith<$Res> {
  _$TetoeicUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? updatedAt = freezed,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TetoeicUserImplCopyWith<$Res>
    implements $TetoeicUserCopyWith<$Res> {
  factory _$$TetoeicUserImplCopyWith(
          _$TetoeicUserImpl value, $Res Function(_$TetoeicUserImpl) then) =
      __$$TetoeicUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, DateTime? updatedAt, int score});
}

/// @nodoc
class __$$TetoeicUserImplCopyWithImpl<$Res>
    extends _$TetoeicUserCopyWithImpl<$Res, _$TetoeicUserImpl>
    implements _$$TetoeicUserImplCopyWith<$Res> {
  __$$TetoeicUserImplCopyWithImpl(
      _$TetoeicUserImpl _value, $Res Function(_$TetoeicUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? updatedAt = freezed,
    Object? score = null,
  }) {
    return _then(_$TetoeicUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TetoeicUserImpl extends _TetoeicUser {
  const _$TetoeicUserImpl({this.name = '', this.updatedAt, this.score = 0})
      : super._();

  factory _$TetoeicUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$TetoeicUserImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final int score;

  @override
  String toString() {
    return 'TetoeicUser(name: $name, updatedAt: $updatedAt, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TetoeicUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, updatedAt, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TetoeicUserImplCopyWith<_$TetoeicUserImpl> get copyWith =>
      __$$TetoeicUserImplCopyWithImpl<_$TetoeicUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TetoeicUserImplToJson(
      this,
    );
  }
}

abstract class _TetoeicUser extends TetoeicUser {
  const factory _TetoeicUser(
      {final String name,
      final DateTime? updatedAt,
      final int score}) = _$TetoeicUserImpl;
  const _TetoeicUser._() : super._();

  factory _TetoeicUser.fromJson(Map<String, dynamic> json) =
      _$TetoeicUserImpl.fromJson;

  @override
  String get name;
  @override
  DateTime? get updatedAt;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$TetoeicUserImplCopyWith<_$TetoeicUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
