import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/map_provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mapController = ref.watch(mapControllerProvider);
    final initialCameraPosition = ref.watch(cameraPositionProvider);

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (controller) {
          mapController = controller;
        },
        zoomControlsEnabled: false,
        initialCameraPosition: initialCameraPosition,
        minMaxZoomPreference: MinMaxZoomPreference(11, 20),
      ),
    );
  }
}
