// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetoiec_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TetoiecUser _$TetoiecUserFromJson(Map<String, dynamic> json) {
  return _TetoiecUser.fromJson(json);
}

/// @nodoc
mixin _$TetoiecUser {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TetoiecUserCopyWith<TetoiecUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TetoiecUserCopyWith<$Res> {
  factory $TetoiecUserCopyWith(
          TetoiecUser value, $Res Function(TetoiecUser) then) =
      _$TetoiecUserCopyWithImpl<$Res, TetoiecUser>;
  @useResult
  $Res call({String name, String id, DateTime? updatedAt, int score});
}

/// @nodoc
class _$TetoiecUserCopyWithImpl<$Res, $Val extends TetoiecUser>
    implements $TetoiecUserCopyWith<$Res> {
  _$TetoiecUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? updatedAt = freezed,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TetoiecUserImplCopyWith<$Res>
    implements $TetoiecUserCopyWith<$Res> {
  factory _$$TetoiecUserImplCopyWith(
          _$TetoiecUserImpl value, $Res Function(_$TetoiecUserImpl) then) =
      __$$TetoiecUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, DateTime? updatedAt, int score});
}

/// @nodoc
class __$$TetoiecUserImplCopyWithImpl<$Res>
    extends _$TetoiecUserCopyWithImpl<$Res, _$TetoiecUserImpl>
    implements _$$TetoiecUserImplCopyWith<$Res> {
  __$$TetoiecUserImplCopyWithImpl(
      _$TetoiecUserImpl _value, $Res Function(_$TetoiecUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? updatedAt = freezed,
    Object? score = null,
  }) {
    return _then(_$TetoiecUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$TetoiecUserImpl extends _TetoiecUser {
  const _$TetoiecUserImpl(
      {this.name = '', this.id = '', this.updatedAt, this.score = 0})
      : super._();

  factory _$TetoiecUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$TetoiecUserImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String id;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final int score;

  @override
  String toString() {
    return 'TetoiecUser(name: $name, id: $id, updatedAt: $updatedAt, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TetoiecUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, updatedAt, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TetoiecUserImplCopyWith<_$TetoiecUserImpl> get copyWith =>
      __$$TetoiecUserImplCopyWithImpl<_$TetoiecUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TetoiecUserImplToJson(
      this,
    );
  }
}

abstract class _TetoiecUser extends TetoiecUser {
  const factory _TetoiecUser(
      {final String name,
      final String id,
      final DateTime? updatedAt,
      final int score}) = _$TetoiecUserImpl;
  const _TetoiecUser._() : super._();

  factory _TetoiecUser.fromJson(Map<String, dynamic> json) =
      _$TetoiecUserImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  DateTime? get updatedAt;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$TetoiecUserImplCopyWith<_$TetoiecUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
