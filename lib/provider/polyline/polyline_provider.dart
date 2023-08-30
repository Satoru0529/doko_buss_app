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
    await readStops(context).then((value) => getRoutes(context));
    return state.when(
      data: (data) => data,
      loading: () => {},
      error: (_, __) => {},
    );
  }

  final String apiKey = 'AIzaSyCsi4yLKlnTJb74RpUMfDiXrgwfa_gvsXI';
  final List<Stops> stopList = [];

  Future<void> readStops(BuildContext context) async {
    final preBiGramList = <String>[];
    final assets =
        await DefaultAssetBundle.of(context).loadString('edamitsu/arate.txt');
    assets.split('\n').forEach(
      (element) async {
        final newRoutes = Stops(
          stopLat: double.parse(element.split(',')[2]),
          stopLon: double.parse(element.split(',')[3]),
        );
        stopList.add(newRoutes);
      },
    );
  }

  Future<List<LatLng>> createPolyline(BuildContext context) async {
    final polylineCoordinates = <LatLng>[];
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(stopList.first.stopLat, stopList.first.stopLon),
      PointLatLng(stopList.last.stopLat, stopList.last.stopLon),
      travelMode: TravelMode.walking,
      wayPoints: stopList
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

  Future<void> getRoutes(BuildContext context) async {
    var points = <LatLng>[];
    points = await createPolyline(context);
    final polyline = Polyline(
      polylineId: const PolylineId('Route'),
      color: Colors.blue,
      width: 5,
      points: points,
    );
    await AsyncValue.guard(
      () async {
        state = AsyncValue.data({polyline});
      },
    );
  }
}
