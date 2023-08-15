import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/map_provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoogleMapController? mapController = ref.watch(mapControllerProvider);
    final initialCameraPosition = ref.watch(cameraPositionProvider);
    final markers = ref.watch(markersStreamProvider);

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (controller) {
          mapController = controller;
        },
        zoomControlsEnabled: false,
        initialCameraPosition: initialCameraPosition,
        minMaxZoomPreference: MinMaxZoomPreference(11, 20),
        markers: markers.when(
          data: (markerData) {
            return Set<Marker>.of(markerData.map((buss) {
              return Marker(
                markerId: MarkerId(buss.id),
                position: LatLng(buss.latitude, buss.longitude),
                infoWindow: InfoWindow(
                  title: 'Bus ID: ${buss.id}',
                ),
              );
            }));
          },
          loading: () => {}, // You can show a loading indicator here if needed
          error: (_, __) => {}, // You can handle error state here if needed
        ),
      ),
    );
  }
}
