import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_times.freezed.dart';
part 'stop_times.g.dart';

@freezed
class StopTimes with _$StopTimes {
  const factory StopTimes({
    @Default('') String id,
    @Default('') String tripId,
    @Default('') String arrivalTime,
    @Default('') String stopId,
    @Default(0) int stopSequence,
    @Default('') String stopHeadsign,
    @Default(0) int pickupType,
    @Default(0) int dropOffType,
  }) = _StopTimes;

  factory StopTimes.fromJson(Map<String, dynamic> json) =>
      _$StopTimesFromJson(json);
}
