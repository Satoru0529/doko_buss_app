import 'package:buss_app/provider/search/search_provider.dart';
import 'package:buss_app/provider/text_editing_controller_provider.dart';
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
    final searchEditingController = ref.watch(searchTextEditingController);
    final searchList = ref.watch(searchNotifierProvider);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

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
