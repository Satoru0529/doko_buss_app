// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_times.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopTimes _$$_StopTimesFromJson(Map<String, dynamic> json) => _$_StopTimes(
      id: json['id'] as String? ?? '',
      tripId: json['tripId'] as String? ?? '',
      arrivalTime: json['arrivalTime'] as int? ?? 0,
      departureTime: json['departureTime'] as int? ?? 0,
      stopId: json['stopId'] as String? ?? '',
      stopSequence: json['stopSequence'] as int? ?? 0,
      stopHeadsign: json['stopHeadsign'] as String? ?? '',
      pickupType: json['pickupType'] as int? ?? 0,
      dropOffType: json['dropOffType'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StopTimesToJson(_$_StopTimes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tripId': instance.tripId,
      'arrivalTime': instance.arrivalTime,
      'departureTime': instance.departureTime,
      'stopId': instance.stopId,
      'stopSequence': instance.stopSequence,
      'stopHeadsign': instance.stopHeadsign,
      'pickupType': instance.pickupType,
      'dropOffType': instance.dropOffType,
    };
