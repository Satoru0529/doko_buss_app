import 'dart:async';

import 'package:buss_app/provider/text_editing_controller_provider.dart';
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
    final searchEditingController = ref.watch(searchTextEditingController);

    final mapControllerCompleter = Completer<GoogleMapController>();
    Position? position;

    Future<void> onMapCreated(GoogleMapController controller) async {
      mapControllerCompleter.complete(controller);
    }

    // 位置データを取得し、カメラを移動させるメソッド
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

    // ウィジェットが初めてビルドされた後にこのメソッドを呼び出す
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await fetchLocationDataAndMoveCamera(ref);
    });

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: AppBar(
              backgroundColor: Colors.black45,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.search),
                    text: 'バス停検索',
                  ),
                  Tab(
                    icon: Icon(Icons.map),
                    text: '路線検索',
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              GoogleMap(
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
                  error: (_, __) =>
                      {}, // You can handle error state here if needed
                ),
              ),
              SizedBox(
                height: 60,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'テキスト検索(2文字以上入力)',
                          // suffixIcon:
                          filled: true,
                          isDense: true,
                          fillColor: const Color.fromARGB(248, 231, 235, 241),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        controller: searchEditingController,
                        onChanged: (text) async {
                          if (text.isNotEmpty) {
                          } else {}
                        },
                        cursorColor: Colors.grey,
                      ),
                    ),
                    const Text(
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
