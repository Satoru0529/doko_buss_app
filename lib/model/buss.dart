// This file is "main.dart"
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'buss.freezed.dart';
part 'buss.g.dart';

// 自動生成のコマンド[flutter pub run build_runner build]

@freezed
class Buss with _$Buss {
  const factory Buss({
    @Default('') String id,
    @Default('') String name,
    @Default(0) double stopLat,
    @Default(0) double stopLon,
  }) = _Buss;

  factory Buss.fromJson(Map<String, Object?> json) => _$BussFromJson(json);
}
