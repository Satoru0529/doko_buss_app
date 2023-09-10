import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/stops/stops.dart';

part 'polyline_provider.g.dart';

@riverpod
class PolylineProvider extends _$PolylineProvider {
  @override
  FutureOr<Set<Polyline>> build(BuildContext context) async {
    await getRoutes();

    /// ここの返り値はもっとスマートに書けるはず
    return state.when(
      data: (data) => data,
      loading: () => {},
      error: (_, __) => {},
    );
  }

  /// todo Google Maps Platform API Key ↓これを非表示にする
  final String apiKey = 'AIzaSyCsi4yLKlnTJb74RpUMfDiXrgwfa_gvsXI';

  /// edamitsu フォルダからバス停の緯度経度を取得
  /// 返り値は List<Stops> で、バス停の緯度経度をリストにして返す
  Future<List<Stops>> readStops(BuildContext context, String file) async {
    final stops = <Stops>[];
    final assets = await DefaultAssetBundle.of(context).loadString(file);
    assets.split('\n').forEach(
      (element) async {
        final newRoutes = Stops(
          stopLat: double.parse(element.split(',')[2]),
          stopLon: double.parse(element.split(',')[3]),
        );
        stops.add(newRoutes);
      },
    );
    return stops;
  }

  /// PolylinePoints を使って、バス停の緯度経度を元に Polyline を作成
  /// 返り値は List<LatLng> で、Polyline を作成するための緯度経度のリストを返す
  Future<List<LatLng>> createPolyline(String file) async {
    final stops = await readStops(context, file);
    final polylineCoordinates = <LatLng>[];
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(stops.first.stopLat, stops.first.stopLon),
      PointLatLng(stops.last.stopLat, stops.last.stopLon),
      travelMode: TravelMode.walking,
      wayPoints: stops
          .map(
            (e) => PolylineWayPoint(
              location: '${e.stopLat},${e.stopLon}',
            ),
          )
          .toList(),
    );

    if (result.points.isNotEmpty) {
      for (final point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }
    return polylineCoordinates;
  }

  /// 路線バスごとに Polyline を作成して、state に格納
  Future<void> getRoutes() async {
    /// 荒手ルートの路線図
    var pointsArate = <LatLng>[];
    pointsArate = await createPolyline('edamitsu/arate.txt');
    final polylineArate = Polyline(
      polylineId: const PolylineId('Arate'),
      color: Colors.blue,
      width: 5,
      points: pointsArate,
    );

    /// 枝光ルートの路線図
    var pointsEdamitsu = <LatLng>[];
    pointsEdamitsu = await createPolyline('edamitsu/edamitsu.txt');
    final polylineEdamitsu = Polyline(
      polylineId: const PolylineId('Edamitsu'),
      color: Colors.red,
      width: 3,
      points: pointsEdamitsu,
    );

    /// 日の出ルートの路線図
    var pointsHinode = <LatLng>[];
    pointsHinode = await createPolyline('edamitsu/hinode.txt');
    final polylineHinode = Polyline(
      polylineId: const PolylineId('Hinode'),
      color: Colors.green,
      width: 3,
      points: pointsHinode,
    );

    /// 山王富士見ルートの路線図
    var pointsSannouFujimi = <LatLng>[];
    pointsSannouFujimi = await createPolyline(
      'edamitsu/sannou_fujimi.txt',
    );
    final polylineSannouFujimi = Polyline(
      polylineId: const PolylineId('SannouFujimi'),
      color: Colors.yellow,
      width: 5,
      points: pointsSannouFujimi,
    );

    /// 山王ルートの路線図
    var pointsSannou = <LatLng>[];
    pointsSannou = await createPolyline('edamitsu/sannou.txt');
    final polylineSannou = Polyline(
      polylineId: const PolylineId('Sannou'),
      color: const Color.fromARGB(255, 200, 34, 229),
      width: 5,
      points: pointsSannou,
    );

    await AsyncValue.guard(
      () async {
        state = AsyncValue.data({
          polylineArate,
          polylineEdamitsu,
          polylineHinode,
          polylineSannouFujimi,
          polylineSannou,
        });
      },
    );
  }
}
