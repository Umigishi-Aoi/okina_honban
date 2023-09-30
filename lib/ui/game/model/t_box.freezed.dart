// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 't_box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TBox {
  Color? get color => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TBoxCopyWith<TBox> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TBoxCopyWith<$Res> {
  factory $TBoxCopyWith(TBox value, $Res Function(TBox) then) =
      _$TBoxCopyWithImpl<$Res, TBox>;
  @useResult
  $Res call({Color? color, Position position});

  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class _$TBoxCopyWithImpl<$Res, $Val extends TBox>
    implements $TBoxCopyWith<$Res> {
  _$TBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TBoxImplCopyWith<$Res> implements $TBoxCopyWith<$Res> {
  factory _$$TBoxImplCopyWith(
          _$TBoxImpl value, $Res Function(_$TBoxImpl) then) =
      __$$TBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color? color, Position position});

  @override
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$TBoxImplCopyWithImpl<$Res>
    extends _$TBoxCopyWithImpl<$Res, _$TBoxImpl>
    implements _$$TBoxImplCopyWith<$Res> {
  __$$TBoxImplCopyWithImpl(_$TBoxImpl _value, $Res Function(_$TBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? position = null,
  }) {
    return _then(_$TBoxImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$TBoxImpl extends _TBox {
  const _$TBoxImpl({this.color, required this.position}) : super._();

  @override
  final Color? color;
  @override
  final Position position;

  @override
  String toString() {
    return 'TBox(color: $color, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TBoxImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TBoxImplCopyWith<_$TBoxImpl> get copyWith =>
      __$$TBoxImplCopyWithImpl<_$TBoxImpl>(this, _$identity);
}

abstract class _TBox extends TBox {
  const factory _TBox({final Color? color, required final Position position}) =
      _$TBoxImpl;
  const _TBox._() : super._();

  @override
  Color? get color;
  @override
  Position get position;
  @override
  @JsonKey(ignore: true)
  _$$TBoxImplCopyWith<_$TBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
