import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_move_notifier.g.dart';

@riverpod
class CameraMoveNotifier extends _$CameraMoveNotifier {
  @override
  FutureOr<double> build() async {
    return 16;
  }

  Future<void> editPin(CameraPosition position, BuildContext context) async {
    state = const AsyncValue.loading();

    await AsyncValue.guard(() async {
      if (state.value! >= 16) {}
    });
  }
}
