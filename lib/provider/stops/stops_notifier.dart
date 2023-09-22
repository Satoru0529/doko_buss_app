// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/stops/stops.dart';
import '../../utils/text_utils.dart';

part 'stops_notifier.g.dart';

@riverpod
class StopsNotifier extends _$StopsNotifier {
  @override
  FutureOr<List<Stops>> build(BuildContext context) async {
    await loadAssetStops(context);
    await _loadPinAsset();
    return state.when(
      data: (data) => data,
      loading: () => [],
      error: (_, __) => [],
    );
  }

  final List<Stops> stops = [];
  BitmapDescriptor? busStopIcon;
  BitmapDescriptor? busLocationIcon;

  BitmapDescriptor? iosBussStopIcon;
  BitmapDescriptor? androidBussStopIcon;

  BitmapDescriptor? iosBussLocationIcon;
  BitmapDescriptor? androidBussLocationIcon;

  Future<void> loadAssetStops(BuildContext context) async {
    final assets =
        await DefaultAssetBundle.of(context).loadString('edamitsu/stops.txt');
    assets.split('\n').forEach(
      (element) async {
        final noBlankName =
            TextUtils.removeUnnecessaryBlankLines(element.split(',')[1]);
        final preBiGramList = <String>[];
        preBiGramList.add(noBlankName);
        final biGramList = TextUtils.tokenize(preBiGramList);

        final biGramMap = {for (var e in biGramList) e: true};

        final newStop = Stops(
          stopId: element.split(',')[0],
          stopName: element.split(',')[1],
          stopLat: double.parse(element.split(',')[2]),
          stopLon: double.parse(element.split(',')[3]),
          biGramMap: biGramMap,
        );
        stops.add(newStop);
      },
    );
    state = AsyncValue.data(stops);
  }

  Future<void> _loadPinAsset() async {
    busStopIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'images/kkrn_icon_bus_2.png',
    );
    busLocationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'images/kkrn_icon_bus_1.png',
    );

    iosBussStopIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'images/stop_icon_ios.png',
    );
    androidBussStopIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'images/stop_icon_android.png',
    );

    iosBussLocationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'images/buss_icon_ios.png',
    );
    androidBussLocationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(8, 8)),
      'images/buss_icon_android.png',
    );
  }
}
