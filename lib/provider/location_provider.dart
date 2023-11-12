import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final locationProvider = FutureProvider<LatLng>(
  (ref) async {
    bool serviceEnabled;
    LocationPermission permission;

    /// 返り値を Nullable にしないためにデフォルト値を設定
    const defaultLatLng = LatLng(33.8794067, 130.8178816);

    // 位置情報サービスが有効かどうかのテスト
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return defaultLatLng;
    }

    //位置情報サービスのパーミッションチェック
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //位置情報にアクセスするための許可を促す
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return defaultLatLng;
      }
    }

    //拒否された場合ここでエラーになる
    if (permission == LocationPermission.deniedForever) {
      return defaultLatLng;
    }

    //許可された場合、位置情報を返す
    final position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  },
);
