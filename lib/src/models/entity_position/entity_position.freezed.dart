// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntityPosition _$EntityPositionFromJson(Map<String, dynamic> json) {
  return _EntityPosition.fromJson(json);
}

/// @nodoc
mixin _$EntityPosition {
  XYTuple get position => throw _privateConstructorUsedError;
  XYTuple get size => throw _privateConstructorUsedError;
  bool get relative => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityPositionCopyWith<EntityPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityPositionCopyWith<$Res> {
  factory $EntityPositionCopyWith(
          EntityPosition value, $Res Function(EntityPosition) then) =
      _$EntityPositionCopyWithImpl<$Res, EntityPosition>;
  @useResult
  $Res call(
      {XYTuple position, XYTuple size, bool relative, DateTime? lastUpdated});

  $XYTupleCopyWith<$Res> get position;
  $XYTupleCopyWith<$Res> get size;
}

/// @nodoc
class _$EntityPositionCopyWithImpl<$Res, $Val extends EntityPosition>
    implements $EntityPositionCopyWith<$Res> {
  _$EntityPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? size = null,
    Object? relative = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      relative: null == relative
          ? _value.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $XYTupleCopyWith<$Res> get position {
    return $XYTupleCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $XYTupleCopyWith<$Res> get size {
    return $XYTupleCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntityPositionImplCopyWith<$Res>
    implements $EntityPositionCopyWith<$Res> {
  factory _$$EntityPositionImplCopyWith(_$EntityPositionImpl value,
          $Res Function(_$EntityPositionImpl) then) =
      __$$EntityPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {XYTuple position, XYTuple size, bool relative, DateTime? lastUpdated});

  @override
  $XYTupleCopyWith<$Res> get position;
  @override
  $XYTupleCopyWith<$Res> get size;
}

/// @nodoc
class __$$EntityPositionImplCopyWithImpl<$Res>
    extends _$EntityPositionCopyWithImpl<$Res, _$EntityPositionImpl>
    implements _$$EntityPositionImplCopyWith<$Res> {
  __$$EntityPositionImplCopyWithImpl(
      _$EntityPositionImpl _value, $Res Function(_$EntityPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? size = null,
    Object? relative = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$EntityPositionImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      relative: null == relative
          ? _value.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntityPositionImpl extends _EntityPosition {
  _$EntityPositionImpl(
      {required this.position,
      required this.size,
      required this.relative,
      this.lastUpdated})
      : super._();

  factory _$EntityPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntityPositionImplFromJson(json);

  @override
  final XYTuple position;
  @override
  final XYTuple size;
  @override
  final bool relative;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'EntityPosition(position: $position, size: $size, relative: $relative, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityPositionImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.relative, relative) ||
                other.relative == relative) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, position, size, relative, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityPositionImplCopyWith<_$EntityPositionImpl> get copyWith =>
      __$$EntityPositionImplCopyWithImpl<_$EntityPositionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntityPositionImplToJson(
      this,
    );
  }
}

abstract class _EntityPosition extends EntityPosition {
  factory _EntityPosition(
      {required final XYTuple position,
      required final XYTuple size,
      required final bool relative,
      final DateTime? lastUpdated}) = _$EntityPositionImpl;
  _EntityPosition._() : super._();

  factory _EntityPosition.fromJson(Map<String, dynamic> json) =
      _$EntityPositionImpl.fromJson;

  @override
  XYTuple get position;
  @override
  XYTuple get size;
  @override
  bool get relative;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$EntityPositionImplCopyWith<_$EntityPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
