// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Buss _$$_BussFromJson(Map<String, dynamic> json) => _$_Buss(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      stopLat: (json['stopLat'] as num?)?.toDouble() ?? 0,
      stopLon: (json['stopLon'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_BussToJson(_$_Buss instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'stopLat': instance.stopLat,
      'stopLon': instance.stopLon,
    };
