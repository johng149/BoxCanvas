// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xy_tuple.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_XYTuple _$$_XYTupleFromJson(Map<String, dynamic> json) => _$_XYTuple(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      relative: json['relative'] as bool,
    );

Map<String, dynamic> _$$_XYTupleToJson(_$_XYTuple instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'relative': instance.relative,
    };
