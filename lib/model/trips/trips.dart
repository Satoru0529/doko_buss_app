import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Trips;

  factory Trips.fromJson(Map<String, dynamic> json) => _$TripsFromJson(json);
}
