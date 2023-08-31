// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trips _$$_TripsFromJson(Map<String, dynamic> json) => _$_Trips(
      id: json['id'] as String? ?? '',
      routeId: json['routeId'] as String? ?? '',
      tripId: json['tripId'] as String? ?? '',
      tripHeadsign: json['tripHeadsign'] as String? ?? '',
      directionId: json['directionId'] as int? ?? 0,
      jpPatternId: json['jpPatternId'] as int? ?? 0,
      startPosition: json['startPosition'] == null
          ? const LatLng(0, 0)
          : const LatLngConverter().fromJson(json['startPosition'] as LatLng),
      endPosition: json['endPosition'] == null
          ? const LatLng(0, 0)
          : const LatLngConverter().fromJson(json['endPosition'] as LatLng),
    );

Map<String, dynamic> _$$_TripsToJson(_$_Trips instance) => <String, dynamic>{
      'id': instance.id,
      'routeId': instance.routeId,
      'tripId': instance.tripId,
      'tripHeadsign': instance.tripHeadsign,
      'directionId': instance.directionId,
      'jpPatternId': instance.jpPatternId,
      'startPosition': const LatLngConverter().toJson(instance.startPosition),
      'endPosition': const LatLngConverter().toJson(instance.endPosition),
    };
