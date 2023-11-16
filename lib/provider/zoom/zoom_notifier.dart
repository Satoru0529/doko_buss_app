import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../stops/stops_notifier.dart';

part 'zoom_notifier.g.dart';

/// 画面のズームレンズを管理する
@riverpod
class ZoomNotifier extends _$ZoomNotifier {
  @override
  double build() {
    return 16;
  }

  void changeZoom(double zoom, BuildContext context) {
    final stopsNotifier = ref.watch(stopsNotifierProvider(context).notifier);

    if (zoom < 16) {
      // await stopsNotifier.deleteStops();
    } else {
      // await stopsNotifier.fetchStops(stops);
    }
  }
}
