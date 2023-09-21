import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_create_notifier.g.dart';

/// GoogleMapController を管理する
@riverpod
class CameraMoveNotifier extends _$CameraMoveNotifier {
  @override
  FutureOr<GoogleMapController?> build() async {
    return null;
  }

  Future<void> getMapController(GoogleMapController controller) async {
    state = const AsyncValue.loading();

    await AsyncValue.guard(() async {
      state = AsyncValue.data(controller);
    });
  }
}
