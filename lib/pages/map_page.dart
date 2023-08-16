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
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ホーム'),
          backgroundColor: Colors.black45,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.sports_baseball)),
              Tab(icon: Icon(Icons.sports_soccer)),
              Tab(icon: Icon(Icons.sports_tennis)),
            ],
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
            Container(
              height: 80,
              child: const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  TextField(
                    maxLength: 50,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      fillColor: Colors.white54,
                      filled: true,
                      icon: Icon(Icons.search),
                      hintText: "バス停の名前を入れてね",
                    ),
                  ),
                  Text(
                    'サッカー',
                    style: TextStyle(fontSize: 32.0),
                  ),
                  Text(
                    'テニス',
                    style: TextStyle(fontSize: 32.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
