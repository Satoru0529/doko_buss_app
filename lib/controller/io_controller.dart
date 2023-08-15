import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/stops.dart';
import '../repository/firestore.dart';

part 'io_controller.g.dart';

@riverpod
class IoController extends _$IoController {
  @override
  Future<void> build() async {}

  String? assets;
  String? stopLat;
  String? stopLon;

  Future<void> loadAsset(BuildContext context) async {
    assets = await DefaultAssetBundle.of(context)
        .loadString('sakegawa_gtfs/stops.txt');
    assets!.split('\n').forEach((element) async {
      final newStop = Stops(
        stopId: element.split(',')[0],
        stopName: element.split(',')[2],
        stopLat: double.parse(element.split(',')[4]),
        stopLon: double.parse(element.split(',')[5]),
      );
      await stopsRef.doc().set(newStop);
    });
  }
}
