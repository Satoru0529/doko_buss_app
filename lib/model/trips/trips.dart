import 'package:buss_app/utils/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'trips.freezed.dart';
part 'trips.g.dart';

@freezed
class Trips with _$Trips {
  const factory Trips({
    @Default('') String id,
    @Default('') String routeId,
    @Default('') String tripId,
    @Default('') String tripHeadsign,
    @Default(0) int directionId,
    @Default(0) int jpPatternId,
    @LatLngConverter()
    @Default(LatLng(0, 0)) LatLng startPosition,
    @LatLngConverter()
    @Default(LatLng(0, 0)) LatLng endPosition,
  }) = _Trips;

  factory Trips.fromJson(Map<String, dynamic> json) => _$TripsFromJson(json);
}
