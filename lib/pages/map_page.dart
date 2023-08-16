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

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              backgroundColor: Colors.black45,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.search)),
                  Tab(icon: Icon(Icons.map)),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                },
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
                  loading: () =>
                      {}, // You can show a loading indicator here if needed
                  error: (_, __) =>
                      {}, // You can handle error state here if needed
                ),
              ),
              const SizedBox(
                height: 60,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                      child: TextField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          fillColor: Colors.white54,
                          filled: true,
                          icon: Icon(Icons.search),
                          hintText: 'バス停の名前を入れてね',
                        ),
                      ),
                    ),
                    Text(
                      'サッカー',
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
