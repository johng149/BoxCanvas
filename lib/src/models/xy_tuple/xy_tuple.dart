import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'xy_tuple.freezed.dart';
part 'xy_tuple.g.dart';

///Holds info about [x] and [y] and if they are [relative] or not
///
///The purpose of this is to hold data about coordinate information, such as
///size or position. Since these coordinates can be absolute or relative to
///screen size, it also has a [relative] flag to indicate if the coordinates
///are relative or absolute
@freezed
class XYTuple with _$XYTuple {
  const XYTuple._();

  factory XYTuple(
      {required double x,
      required double y,
      required bool relative}) = _XYTuple;

  factory XYTuple.fromJson(Map<String, dynamic> json) =>
      _$XYTupleFromJson(json);

  bool get isRelative => relative;
  bool get isAbsolute => !relative;

  ///Create [XYTuple] with values set to 0 and with given [relative] status
  factory XYTuple.zero(bool relative) {
    return XYTuple(x: 0, y: 0, relative: relative);
  }

  ///Current [XYTuple] with values multiplied by -1. [relative] status unchanged
  XYTuple negate() {
    return copyWith(x: -x, y: -y);
  }

  ///Adds respective values from current and [other] together
  ///
  ///If [relative] is not specified, the newly created [relative] status will
  ///be the same as current [XYTuple], otherwise, new [relative] status will
  ///be set to given [relative]
  XYTuple add({required XYTuple other, bool? relative}) {
    bool relativeStatus = relative ?? this.relative;
    return copyWith(x: x + other.x, y: y + other.y, relative: relativeStatus);
  }

  XYTuple ensureGr([double minimum = 32]) {
    return copyWith(x: max(x, minimum), y: max(y, minimum));
  }

  ///Makes current [XYTuple] values absolute based on given [constraints]
  XYTuple toAbsolute(BoxConstraints constraints) {
    if (isAbsolute) {
      return this;
    } else {
      double x = this.x * constraints.maxWidth;
      double y = this.y * constraints.maxHeight;
      return copyWith(x: x, y: y, relative: false);
    }
  }

  ///Makes current [XYTuple] values relative based on given [constraints]
  XYTuple toRelative(BoxConstraints constraints) {
    if (isRelative) {
      return this;
    } else {
      double x = this.x / constraints.maxWidth;
      double y = this.y / constraints.maxHeight;
      return copyWith(x: x, y: y, relative: true);
    }
  }
}
