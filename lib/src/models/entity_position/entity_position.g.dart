// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityPositionImpl _$$EntityPositionImplFromJson(Map<String, dynamic> json) =>
    _$EntityPositionImpl(
      position: XYTuple.fromJson(json['position'] as Map<String, dynamic>),
      size: XYTuple.fromJson(json['size'] as Map<String, dynamic>),
      relative: json['relative'] as bool,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$EntityPositionImplToJson(
        _$EntityPositionImpl instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'size': instance.size.toJson(),
      'relative': instance.relative,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };
