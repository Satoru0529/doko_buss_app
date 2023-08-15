
import 'package:buss_app/repository/firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/stops.dart';

part 'io_controller.g.dart';

@riverpod
class IoController extends _$IoController {
  @override
  Future<void> build() async {}

  String? assets;

  Future<void> loadAsset(BuildContext context) async {
    assets = await DefaultAssetBundle.of(context)
        .loadString('sakegawa_gtfs/stops.txt');
    assets!.split('\n').forEach((element) async {
      debugPrint(element);
      final newStop = Stops(
        stopId: element.split(',')[0],
        stopName: element.split(',')[2],
        stopLat: element.split(',')[4],
        stopLon: element.split(',')[5],
      );
      await stopsRef.doc().set(newStop);
    });
  }
}
