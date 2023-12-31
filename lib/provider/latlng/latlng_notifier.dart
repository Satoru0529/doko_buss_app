import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/stops/stops.dart';
import '../location_provider.dart';
import '../map_create/map_create_notifier.dart';

part 'latlng_notifier.g.dart';

@riverpod
class LatLngNotifier extends _$LatLngNotifier {
  @override
  FutureOr<LatLng> build() async {
    final latLng = await ref.refresh(locationProvider.future);
    return latLng;
  }

  /// user の位置を取得
  Future<void> searchPosition(Stops stops) async {
    state = const AsyncValue.loading();

    final mapController = ref.read(cameraMoveNotifierProvider);

    await AsyncValue.guard(
      () async {
        /// マーカーの位置に移動
        await mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(stops.stopLat, stops.stopLon),
              zoom: 16,
            ),
          ),
        );

        state = AsyncValue.data(
          LatLng(stops.stopLat, stops.stopLon),
        );
      },
    );
  }
}
