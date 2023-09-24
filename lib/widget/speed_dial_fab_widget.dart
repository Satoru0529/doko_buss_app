import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/map_create/map_create_notifier.dart';
import '../provider/stops/stops_notifier.dart';

class SpeedDialFabWidget extends ConsumerWidget {
  const SpeedDialFabWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopsNotifier = ref.watch(StopsNotifierProvider(context).notifier);
    final mapController = ref.watch(cameraMoveNotifierProvider);
    return Positioned(
      right: 20,
      bottom: 20,
      child: SpeedDial(
        activeIcon: Icons.close,
        backgroundColor: Colors.blue.shade300,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.location_on),
            label: '枝光周辺に移動',
            onTap: () async {
              await mapController.value!.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target: LatLng(33.8794067, 130.8178816),
                    zoom: 16,
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.message),
            label: 'フィードバック',
            onTap: () async {
              await stopsNotifier.launchURL();
            },
          ),
        ],
        child: const Icon(
          Icons.info,
          size: 30,
        ),
      ),
    );
  }
}
