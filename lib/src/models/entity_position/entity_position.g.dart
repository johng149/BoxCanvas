// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntityPosition _$$_EntityPositionFromJson(Map<String, dynamic> json) =>
    _$_EntityPosition(
      position: XYTuple.fromJson(json['position'] as Map<String, dynamic>),
      size: XYTuple.fromJson(json['size'] as Map<String, dynamic>),
      relative: json['relative'] as bool,
    );

Map<String, dynamic> _$$_EntityPositionToJson(_$_EntityPosition instance) =>
    <String, dynamic>{
      'position': instance.position,
      'size': instance.size,
      'relative': instance.relative,
    };
