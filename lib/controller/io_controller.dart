import 'package:buss_app/model/stops/stops.dart';
import 'package:buss_app/repository/firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/text_utils.dart';

part 'io_controller.g.dart';

@riverpod
class IoController extends _$IoController {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  String? assets;
  // Future<void> loadAssetStops(BuildContext context) async {
  //   assets = await DefaultAssetBundle.of(context)
  //       .loadString('sakegawa_gtfs/stops.txt');
  //   assets!.split('\n').forEach(
  //     (element) async {
  // final noBlankName =
  //     TextUtils.removeUnnecessaryBlankLines(element.split(',')[2]);
  // final preBiGramList = <String>[];
  // preBiGramList.add(noBlankName);
  // final biGramList = TextUtils.tokenize(preBiGramList);

  // final biGramMap = {for (var e in biGramList) e: true};

  //       final newStop = Stops(
  // stopId: element.split(',')[0],
  // stopName: element.split(',')[2],
  // stopLat: double.parse(element.split(',')[4]),
  // stopLon: double.parse(element.split(',')[5]),
  // biGramMap: biGramMap,
  //       );
  //       await stopsRef.doc().set(newStop);
  //     },
  //   );
  // }

  // Future<void> loadAssetStopTimes(BuildContext context) async {
  //   assets = await DefaultAssetBundle.of(context)
  //       .loadString('sakegawa_gtfs/stop_times.txt');
  //   assets!.split('\n').forEach(
  //     (element) async {
  //       final arrival = element.split(',')[1];
  //       final departure = element.split(',')[2];

  //       final arrivalTime = arrival.replaceAll(':', '');
  //       final departureTime = departure.replaceAll(':', '');

  //       final newStopTimes = StopTimes(
  //         tripId: element.split(',')[0],
  //         arrivalTime: int.parse(arrivalTime),
  //         departureTime: int.parse(departureTime),
  //         stopId: element.split(',')[3],
  //         stopSequence: int.parse(element.split(',')[4]),
  //         stopHeadsign: element.split(',')[5],
  //         pickupType: int.parse(element.split(',')[6]),
  //         dropOffType: int.parse(element.split(',')[7]),
  //       );
  //       await stopTimesRef.doc().set(newStopTimes);
  //     },
  //   );
  // }

  // Future<void> loadAssetTrips(BuildContext context) async {
  //   assets = await DefaultAssetBundle.of(context)
  //       .loadString('sakegawa_gtfs/trips.txt');
  //   assets!.split('\n').forEach(
  //     (element) async {
  //       final newTrips = Trips(
  //         routeId: element.split(',')[0],
  //         tripId: element.split(',')[2],
  //         tripHeadsign: element.split(',')[3],
  //         directionId: int.parse(element.split(',')[4]),
  //         jpPatternId: int.parse(element.split(',')[9]),
  //       );
  //       await tripsRef.doc().set(newTrips);
  //     },
  //   );
  // }

  Future<void> loadAssetTripsRoutes(BuildContext context) async {
    state = const AsyncValue.loading();

    await AsyncValue.guard(() async {
      final preBiGramList = <String>[];
      assets = await DefaultAssetBundle.of(context)
          .loadString('sakegawa_gtfs/121002.txt');
      assets!.split('\n').forEach(
        (element) async {
          final text = element.split(',')[2];
          final noBlankName = TextUtils.removeUnnecessaryBlankLines(text);
          preBiGramList.add(noBlankName);
          final biGramList = TextUtils.tokenize(preBiGramList);
          final biGramMap = {for (var e in biGramList) e: true};
          final newRoutes = Stops(
            stopId: element.split(',')[0],
            stopName: text,
            stopLat: double.parse(element.split(',')[4]),
            stopLon: double.parse(element.split(',')[5]),
            biGramMap: biGramMap,
          );
          await tripsRef.doc().set(newRoutes);
        },
      );
      state = AsyncValue.data(assets);
    });
  }
}
