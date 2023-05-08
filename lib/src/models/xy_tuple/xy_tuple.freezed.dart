// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xy_tuple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

XYTuple _$XYTupleFromJson(Map<String, dynamic> json) {
  return _XYTuple.fromJson(json);
}

/// @nodoc
mixin _$XYTuple {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  bool get relative => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $XYTupleCopyWith<XYTuple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XYTupleCopyWith<$Res> {
  factory $XYTupleCopyWith(XYTuple value, $Res Function(XYTuple) then) =
      _$XYTupleCopyWithImpl<$Res, XYTuple>;
  @useResult
  $Res call({double x, double y, bool relative});
}

/// @nodoc
class _$XYTupleCopyWithImpl<$Res, $Val extends XYTuple>
    implements $XYTupleCopyWith<$Res> {
  _$XYTupleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? relative = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      relative: null == relative
          ? _value.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_XYTupleCopyWith<$Res> implements $XYTupleCopyWith<$Res> {
  factory _$$_XYTupleCopyWith(
          _$_XYTuple value, $Res Function(_$_XYTuple) then) =
      __$$_XYTupleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, bool relative});
}

/// @nodoc
class __$$_XYTupleCopyWithImpl<$Res>
    extends _$XYTupleCopyWithImpl<$Res, _$_XYTuple>
    implements _$$_XYTupleCopyWith<$Res> {
  __$$_XYTupleCopyWithImpl(_$_XYTuple _value, $Res Function(_$_XYTuple) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? relative = null,
  }) {
    return _then(_$_XYTuple(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      relative: null == relative
          ? _value.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_XYTuple extends _XYTuple {
  _$_XYTuple({required this.x, required this.y, required this.relative})
      : super._();

  factory _$_XYTuple.fromJson(Map<String, dynamic> json) =>
      _$$_XYTupleFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final bool relative;

  @override
  String toString() {
    return 'XYTuple(x: $x, y: $y, relative: $relative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_XYTuple &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.relative, relative) ||
                other.relative == relative));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, relative);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_XYTupleCopyWith<_$_XYTuple> get copyWith =>
      __$$_XYTupleCopyWithImpl<_$_XYTuple>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_XYTupleToJson(
      this,
    );
  }
}

abstract class _XYTuple extends XYTuple {
  factory _XYTuple(
      {required final double x,
      required final double y,
      required final bool relative}) = _$_XYTuple;
  _XYTuple._() : super._();

  factory _XYTuple.fromJson(Map<String, dynamic> json) = _$_XYTuple.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  bool get relative;
  @override
  @JsonKey(ignore: true)
  _$$_XYTupleCopyWith<_$_XYTuple> get copyWith =>
      throw _privateConstructorUsedError;
}
