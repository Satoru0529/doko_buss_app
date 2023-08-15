// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Buss _$$_BussFromJson(Map<String, dynamic> json) => _$_Buss(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_BussToJson(_$_Buss instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
