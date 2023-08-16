import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/map_provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mapController = ref.watch(mapControllerProvider);
    final initialCameraPosition = ref.watch(cameraPositionProvider);
    final markers = ref.watch(markersStreamProvider);

    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: initialCameraPosition,
        minMaxZoomPreference: const MinMaxZoomPreference(11, 20),
        markers: markers.when(
          data: (markerData) {
            return Set<Marker>.of(
              markerData.map(
                (stop) {
                  return Marker(
                    markerId: MarkerId(stop.id),
                    position: LatLng(stop.stopLat, stop.stopLon),
                    infoWindow: InfoWindow(
                      title: stop.stopName,
                    ),
                  );
                },
              ),
            );
          },
          loading: () => {}, // You can show a loading indicator here if needed
          error: (_, __) => {}, // You can handle error state here if needed
        ),
      ),
    );
  }
}
