import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// json_serializable パッケージによって自動生成される **.g.dart ファイルはDartのオブジェクトしか使用できないため、
// パッケージ内で定義されているクラス型のフィールドを持つクラスで **.g.dart ファイルを使用する際に必要なコンバーター
class LatLngConverter implements JsonConverter<LatLng, LatLng> {
  const LatLngConverter();

  @override
  LatLng fromJson(LatLng reference) => reference;

  @override
  LatLng toJson(LatLng reference) => reference;
}
