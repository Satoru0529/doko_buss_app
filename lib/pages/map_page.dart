import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/location_provider.dart';
import '../provider/map_provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markersStreamProvider);

    final mapControllerCompleter = Completer<GoogleMapController>();
    Position? position;

    Future<void> onMapCreated(GoogleMapController controller) async {
      mapControllerCompleter.complete(controller);
    }

    Future<void> fetchLocationDataAndMoveCamera(WidgetRef ref) async {
      position = await ref.refresh(locationProvider.future);
      final mapController = await mapControllerCompleter.future;
      final latitude = position?.latitude;
      final longitude = position?.longitude;
      if (latitude == null || longitude == null) {
        return;
      }
      await mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 16,
          ),
        ),
      );
    }

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await fetchLocationDataAndMoveCamera(ref);
    });

    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            position?.latitude ?? 36,
            position?.longitude ?? 140,
          ),
          zoom: 16,
        ),
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
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
