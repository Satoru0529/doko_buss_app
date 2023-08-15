import 'package:freezed_annotation/freezed_annotation.dart';

part 'stops.freezed.dart';
part 'stops.g.dart';

@freezed
class Stops with _$Stops {
  const factory Stops({
    @Default('') String stopId, // 1
    @Default('') String stopName, // 3
    @Default('') String stopLat, // 5
    @Default('') String stopLon, // 6
    @Default('') String zoneId, // 7
  }) = _Stops;

  factory Stops.fromJson(Map<String, dynamic> json) => _$StopsFromJson(json);
}
