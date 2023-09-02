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
    await readStopsArate(context).then(
      (value) => readStopsEdamitsu(context).then(
        (value) => getRoutes(),
      ),
    );

    return state.when(
      data: (data) => data,
      loading: () => {},
      error: (_, __) => {},
    );
  }

  final String apiKey = 'AIzaSyCsi4yLKlnTJb74RpUMfDiXrgwfa_gvsXI';
  final List<Stops> stopListArate = [];
  final List<Stops> stopListEdamitsu = [];

  Future<void> readStopsArate(BuildContext context) async {
    final preBiGramList = <String>[];
    final assets =
        await DefaultAssetBundle.of(context).loadString('edamitsu/arate.txt');
    assets.split('\n').forEach(
      (element) async {
        final newRoutes = Stops(
          stopLat: double.parse(element.split(',')[2]),
          stopLon: double.parse(element.split(',')[3]),
        );
        stopListArate.add(newRoutes);
      },
    );
  }

  Future<void> readStopsEdamitsu(BuildContext context) async {
    final preBiGramList = <String>[];
    final assets = await DefaultAssetBundle.of(context)
        .loadString('edamitsu/edamitsu.txt');
    assets.split('\n').forEach(
      (element) async {
        final newRoutes = Stops(
          stopLat: double.parse(element.split(',')[2]),
          stopLon: double.parse(element.split(',')[3]),
        );
        stopListEdamitsu.add(newRoutes);
      },
    );
  }

  Future<List<LatLng>> createPolylineArate() async {
    final polylineCoordinates = <LatLng>[];
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(stopListArate.first.stopLat, stopListArate.first.stopLon),
      PointLatLng(stopListArate.last.stopLat, stopListArate.last.stopLon),
      wayPoints: stopListArate
          .map(
            (e) => PolylineWayPoint(
              location: '${e.stopLat},${e.stopLon}',
            ),
          )
          .toList(),
    );

    if (result.points.isNotEmpty) {
      for (final point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    return polylineCoordinates;
  }

  Future<List<LatLng>> createPolylineEdamitsu() async {
    final polylineCoordinates = <LatLng>[];
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(
        stopListEdamitsu.first.stopLat,
        stopListEdamitsu.first.stopLon,
      ),
      PointLatLng(stopListEdamitsu.last.stopLat, stopListEdamitsu.last.stopLon),
      wayPoints: stopListEdamitsu
          .map(
            (e) => PolylineWayPoint(
              location: '${e.stopLat},${e.stopLon}',
            ),
          )
          .toList(),
    );

    if (result.points.isNotEmpty) {
      for (final point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    return polylineCoordinates;
  }

  Future<void> getRoutes() async {
    var pointsArate = <LatLng>[];
    pointsArate = await createPolylineArate();
    final polyline = Polyline(
      polylineId: const PolylineId('Arate'),
      color: Colors.blue,
      width: 5,
      points: pointsArate,
    );
    var pointsEdamitsu = <LatLng>[];
    pointsEdamitsu = await createPolylineEdamitsu();
    final polyline2 = Polyline(
      polylineId: const PolylineId('Edamitsu'),
      color: Colors.red,
      width: 3,
      points: pointsEdamitsu,
    );
    await AsyncValue.guard(
      () async {
        state = AsyncValue.data({polyline, polyline2});
      },
    );
  }
}
