import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_times.freezed.dart';
part 'stop_times.g.dart';

@freezed
class StopTimes with _$StopTimes {
  const factory StopTimes({
    required String id,
  }) = _StopTimes;
  
  factory StopTimes.fromJson(Map<String, dynamic> json) => _$StopTimesFromJson(json);
}
