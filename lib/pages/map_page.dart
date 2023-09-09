import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/latlng/latlng_provider.dart';
import '../provider/polyline/polyline_provider.dart';
import '../provider/search/search_provider.dart';
import '../provider/stops/stops_notifier.dart';
import '../provider/text_editing_controller_provider.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// edamitsu/stops.txt から取得したバス停のリスト
    final stops = ref.watch(StopsNotifierProvider(context));

    /// TextEditingController <= これいらん
    final searchEditingController = ref.watch(searchTextEditingController);

    /// 検索した際に検索ヒットしたバス停のリスト
    final searchList = ref.watch(searchNotifierProvider);

    /// 検索メソッド
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

    /// 現在地を取得
    final location = ref.watch(latLngNotifierProvider);

    /// フォーカスする位置を監視する
    final latLngNotifier = ref.watch(latLngNotifierProvider.notifier);

    /// 路線図を表示
    final polyline = ref.watch(polylineProviderProvider(context));

    return Scaffold(
      /// Stack を採用
      /// マップを一番下にして、検索バーやボタンを上に重ねる
      body: Stack(
        children: [
          /// 現在地を GoogleMap に反映
          location.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            data: (position) {
              return GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    position?.latitude ?? 36,
                    position?.longitude ?? 140,
                  ),
                  zoom: 16,
                ),
                myLocationEnabled: true,
                mapToolbarEnabled: false,

                /// ポリラインを表示
                polylines: polyline.when(
                  data: (polylineData) {
                    return polylineData;
                  },
                  loading: () => {},
                  error: (_, __) => {},
                ),

                /// マーカーを表示
                /// stops は edamitsu/stops.txt から取得したバス停のリスト
                markers: stops.when(
                  data: (stops) {
                    return Set<Marker>.of(
                      stops.map(
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
              );
            },
          ),

          /// 検索バー
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'テキスト検索(2文字以上入力)',
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
                    await searchNotifier.searchStop(text, context);
                  },
                  cursorColor: Colors.grey,
                ),
              ),
              /// 検索結果を表示
              searchList.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                data: (list) {
                  /// 検索結果がない場合は表示しない
                  if (list.isEmpty) {
                    return const SizedBox(
                      height: 0,
                    );
                  }
                  return Card(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final stop = list[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(stop.stopName),
                              onTap: () async {
                                /// latLngNotifier に選択したバス停の位置情報を渡す
                                await latLngNotifier.searchPosition(stop);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
