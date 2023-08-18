import 'package:buss_app/model/stop_low/stop_low.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../location_provider.dart';

part 'latlng_provider.g.dart';

@riverpod
class LatLngNotifier extends _$LatLngNotifier {
  @override
  FutureOr<Position?> build() async {
    final position = await ref.refresh(locationProvider.future);
    state = AsyncValue.data(position);
    return position;
  }

  Future<void> searchPosition(StopLow stopLow) async {
    state = const AsyncValue.loading();

    await AsyncValue.guard(
      () async {
        state = AsyncValue.data(
          Position(
            longitude: stopLow.stopLat,
            latitude: stopLow.stopLon,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
          ),
        );
      },
    );
  }
}
