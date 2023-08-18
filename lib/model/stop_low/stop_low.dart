// ignore_for_file: strict_raw_type

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_low.freezed.dart';
part 'stop_low.g.dart';

@freezed
class StopLow with _$StopLow {
  const factory StopLow({
    /// Doc ID
    @Default('') String id,

    /// num_1 or num_2 (上り or 下り)
    @Default('') String stopId,

    /// バス停名
    @Default('') String stopName,

    /// バス停の緯度
    @Default(0) double stopLat,

    /// バス停の経度
    @Default(0) double stopLon,

    /// バス停名の bi-gram
    @Default({'': ''}) Map biGramMap,
  }) = _StopLow;

  factory StopLow.fromJson(Map<String, dynamic> json) =>
      _$StopLowFromJson(json);
}
