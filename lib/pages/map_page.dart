import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/map_provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markersStreamProvider);

    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12.0,
        ),
        myLocationEnabled: true,
        zoomControlsEnabled: false,
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
          loading: () => {},
          error: (_, __) => {},
        ),
      ),
    );
  }
}
