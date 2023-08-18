// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_low.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopLow _$$_StopLowFromJson(Map<String, dynamic> json) => _$_StopLow(
      id: json['id'] as String? ?? '',
      stopId: json['stopId'] as String? ?? '',
      stopName: json['stopName'] as String? ?? '',
      stopLat: (json['stopLat'] as num?)?.toDouble() ?? 0,
      stopLon: (json['stopLon'] as num?)?.toDouble() ?? 0,
      biGramMap: json['biGramMap'] as Map<String, dynamic>? ?? const {'': ''},
    );

Map<String, dynamic> _$$_StopLowToJson(_$_StopLow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stopId': instance.stopId,
      'stopName': instance.stopName,
      'stopLat': instance.stopLat,
      'stopLon': instance.stopLon,
      'biGramMap': instance.biGramMap,
    };
