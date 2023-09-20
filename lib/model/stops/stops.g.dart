// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stops _$$_StopsFromJson(Map<String, dynamic> json) => _$_Stops(
      stopId: json['stopId'] as String? ?? '',
      stopName: json['stopName'] as String? ?? '',
      stopLat: (json['stopLat'] as num?)?.toDouble() ?? 0,
      stopLon: (json['stopLon'] as num?)?.toDouble() ?? 0,
      biGramMap: json['biGramMap'] as Map<String, dynamic>? ?? const {'': ''},
    );

Map<String, dynamic> _$$_StopsToJson(_$_Stops instance) => <String, dynamic>{
      'stopId': instance.stopId,
      'stopName': instance.stopName,
      'stopLat': instance.stopLat,
      'stopLon': instance.stopLon,
      'biGramMap': instance.biGramMap,
    };
