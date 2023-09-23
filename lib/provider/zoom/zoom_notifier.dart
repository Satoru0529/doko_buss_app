import 'package:buss_app/provider/stops/stops_notifier.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zoom_notifier.g.dart';

/// 画面のズームレンズを管理する
@riverpod
class ZoomNotifier extends _$ZoomNotifier {
  @override
  FutureOr<double> build() {
    return state.when(
      data: (data) => data,
      loading: () => 0,
      error: (_, __) => 0,
    );
  }

  Future<void> changeZoom(double zoom, BuildContext context) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(() async {
      final stopsNotifier = ref.watch(stopsNotifierProvider(context).notifier);
      
      if (zoom < 16) {
        // await stopsNotifier.deleteStops();
      } else {
        // await stopsNotifier.fetchStops(stops);
      }
      state = AsyncValue.data(zoom);
    });
  }
}
