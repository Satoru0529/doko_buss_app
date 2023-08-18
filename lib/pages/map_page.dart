import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/location_provider.dart';
import '../provider/map_provider.dart';
import '../provider/search/search_provider.dart';
import '../provider/text_editing_controller_provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markersStreamProvider);
    final searchEditingController = ref.watch(searchTextEditingController);
    final searchList = ref.watch(searchNotifierProvider);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchLocationDataAndMoveCamera(ref);
    });

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(1000),
            child: ColoredBox(
              color: Color.fromARGB(244, 93, 91, 91),
              child: TabBar(
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
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 400, minHeight: 100),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'テキスト検索(2文字以上入力)',
                              // suffixIcon:
                              filled: true,
                              isDense: true,
                              fillColor:
                                  const Color.fromARGB(248, 231, 235, 241),
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            controller: searchEditingController,
                            onChanged: (text) async {
                              await searchNotifier.searchStop(text);
                            },
                            cursorColor: Colors.grey,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 50,
                            maxHeight: 100,
                          ),
                          child: searchList.when(
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                            data: (list) {
                              if (list.isEmpty) {
                                return const SizedBox();
                              }
                              return Card(
                                child: ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    final stop = list[index];
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(stop.stopName),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
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