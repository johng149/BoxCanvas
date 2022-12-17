// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityPositionCopyWith<EntityPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityPositionCopyWith<$Res> {
  factory $EntityPositionCopyWith(
          EntityPosition value, $Res Function(EntityPosition) then) =
      _$EntityPositionCopyWithImpl<$Res>;
  $Res call({XYTuple position, XYTuple size, bool relative});

  $XYTupleCopyWith<$Res> get position;
  $XYTupleCopyWith<$Res> get size;
}

/// @nodoc
class _$EntityPositionCopyWithImpl<$Res>
    implements $EntityPositionCopyWith<$Res> {
  _$EntityPositionCopyWithImpl(this._value, this._then);

  final EntityPosition _value;
  // ignore: unused_field
  final $Res Function(EntityPosition) _then;

  @override
  $Res call({
    Object? position = freezed,
    Object? size = freezed,
    Object? relative = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      relative: relative == freezed
          ? _value.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $XYTupleCopyWith<$Res> get position {
    return $XYTupleCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value));
    });
  }

  @override
  $XYTupleCopyWith<$Res> get size {
    return $XYTupleCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value));
    });
  }
}

/// @nodoc
abstract class _$$_EntityPositionCopyWith<$Res>
    implements $EntityPositionCopyWith<$Res> {
  factory _$$_EntityPositionCopyWith(
          _$_EntityPosition value, $Res Function(_$_EntityPosition) then) =
      __$$_EntityPositionCopyWithImpl<$Res>;
  @override
  $Res call({XYTuple position, XYTuple size, bool relative});

  @override
  $XYTupleCopyWith<$Res> get position;
  @override
  $XYTupleCopyWith<$Res> get size;
}

/// @nodoc
class __$$_EntityPositionCopyWithImpl<$Res>
    extends _$EntityPositionCopyWithImpl<$Res>
    implements _$$_EntityPositionCopyWith<$Res> {
  __$$_EntityPositionCopyWithImpl(
      _$_EntityPosition _value, $Res Function(_$_EntityPosition) _then)
      : super(_value, (v) => _then(v as _$_EntityPosition));

  @override
  _$_EntityPosition get _value => super._value as _$_EntityPosition;

  @override
  $Res call({
    Object? position = freezed,
    Object? size = freezed,
    Object? relative = freezed,
  }) {
    return _then(_$_EntityPosition(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as XYTuple,
      relative: relative == freezed
          ? _value.relative
          : relative // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityPosition extends _EntityPosition {
  _$_EntityPosition(
      {required this.position, required this.size, required this.relative})
      : super._();

  factory _$_EntityPosition.fromJson(Map<String, dynamic> json) =>
      _$$_EntityPositionFromJson(json);

  @override
  final XYTuple position;
  @override
  final XYTuple size;
  @override
  final bool relative;

  @override
  String toString() {
    return 'EntityPosition(position: $position, size: $size, relative: $relative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityPosition &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.relative, relative));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(relative));

  @JsonKey(ignore: true)
  @override
  _$$_EntityPositionCopyWith<_$_EntityPosition> get copyWith =>
      __$$_EntityPositionCopyWithImpl<_$_EntityPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityPositionToJson(
      this,
    );
  }
}

abstract class _EntityPosition extends EntityPosition {
  factory _EntityPosition(
      {required final XYTuple position,
      required final XYTuple size,
      required final bool relative}) = _$_EntityPosition;
  _EntityPosition._() : super._();

  factory _EntityPosition.fromJson(Map<String, dynamic> json) =
      _$_EntityPosition.fromJson;

  @override
  XYTuple get position;
  @override
  XYTuple get size;
  @override
  bool get relative;
  @override
  @JsonKey(ignore: true)
  _$$_EntityPositionCopyWith<_$_EntityPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
