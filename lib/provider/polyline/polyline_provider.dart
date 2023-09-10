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

    return state.when(
      data: (data) => data,
      loading: () => {},
      error: (_, __) => {},
    );
  }

  final String apiKey = 'AIzaSyCsi4yLKlnTJb74RpUMfDiXrgwfa_gvsXI';
  final List<Stops> stopListArate = [];
  final List<Stops> stopListEdamitsu = [];
  final List<Stops> stopListHinode = [];
  final List<Stops> stopListSannouFujimi = [];
  final List<Stops> stopListSannou = [];

  Future<void> readStops(
    BuildContext context,
    String file,
    List<Stops> stops,
  ) async {
    final preBiGramList = <String>[];
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
  }

  Future<List<LatLng>> createPolyline(String file, List<Stops> stops) async {
    await readStops(context, file, stops);
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

  Future<void> getRoutes() async {
    /// 荒手ルートの路線図
    var pointsArate = <LatLng>[];
    pointsArate = await createPolyline('edamitsu/arate.txt', stopListArate);
    final polylineArate = Polyline(
      polylineId: const PolylineId('Arate'),
      color: Colors.blue,
      width: 5,
      points: pointsArate,
    );

    /// 枝光ルートの路線図
    var pointsEdamitsu = <LatLng>[];
    pointsEdamitsu =
        await createPolyline('edamitsu/edamitsu.txt', stopListEdamitsu);
    final polylineEdamitsu = Polyline(
      polylineId: const PolylineId('Edamitsu'),
      color: Colors.red,
      width: 3,
      points: pointsEdamitsu,
    );

    /// 日の出ルートの路線図
    var pointsHinode = <LatLng>[];
    pointsHinode = await createPolyline('edamitsu/hinode.txt', stopListHinode);
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
      stopListSannouFujimi,
    );
    final polylineSannouFujimi = Polyline(
      polylineId: const PolylineId('SannouFujimi'),
      color: Colors.yellow,
      width: 5,
      points: pointsSannouFujimi,
    );

    /// 山王ルートの路線図
    var pointsSannou = <LatLng>[];
    pointsSannou = await createPolyline('edamitsu/sannou.txt', stopListSannou);
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
