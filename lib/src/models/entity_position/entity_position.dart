import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'entity_position.freezed.dart';
part 'entity_position.g.dart';

@freezed
class EntityPosition with _$EntityPosition {
  const EntityPosition._();

  factory EntityPosition(
      {required XYTuple position,
      required XYTuple size,
      required bool relative}) = _EntityPosition;

  factory EntityPosition.fromJson(Map<String, dynamic> json) =>
      _$EntityPositionFromJson(json);

  bool get isRelative => relative;

  bool get isAbsolute => !relative;

  ///Converts position and size to absolute values based on [constraints]
  ///
  ///Uses the [toAbsolute] function of its [XYTuple] fields
  EntityPosition toAbsolute(BoxConstraints constraints) {
    if (isAbsolute) {
      return this;
    } else {
      final position = this.position.toAbsolute(constraints);
      final size = this.size.toAbsolute(constraints);
      return copyWith(position: position, size: size, relative: false);
    }
  }

  ///Converts position and size to relative values based on [constraints]
  ///
  ///Uses the [toRelative] function of its [XYTuple] fields
  EntityPosition toRelative(BoxConstraints constraints) {
    if (isRelative) {
      return this;
    } else {
      final position = this.position.toRelative(constraints);
      final size = this.size.toRelative(constraints);
      return copyWith(position: position, size: size, relative: true);
    }
  }
}
