import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/latlng/latlng_provider.dart';
import '../provider/polyline/polyline_provider.dart';
import '../provider/stops/stops_notifier.dart';
import '../widget/search_widget.dart';

class MapPage extends ConsumerWidget {
  const MapPage({
    super.key,
    required this.deviceHeight,
  });

  final double deviceHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// edamitsu/stops.txt から取得したバス停のリスト
    final stops = ref.watch(StopsNotifierProvider(context));

    /// 現在地を取得
    final location = ref.watch(latLngNotifierProvider);

    /// 路線図を表示
    final polyline = ref.watch(polylineProviderProvider(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,

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

          /// 検索 widget
          const SearchWidget(),
          Positioned(
            left: 20,
            top: deviceHeight - 70,
            child: FloatingActionButton(
              onPressed: () async {
                await mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      target: LatLng(33.8794067, 130.8178816),
                      zoom: 16,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: ClipOval(
              child: Material(
                color: Colors.black38,
                child: InkWell(
                  splashColor: Colors.black54,
                  onTap: _launchURL,
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // URLを開く関数
  Future<void> _launchURL() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLScMkbZAcC-Jy6gAyscSI7KfNkbRQdoqF5c_NF8U9Y6MLtulJg/viewform?usp=sf_link';
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      // canLaunchUrlを使用
      await launchUrl(uri); // launchUrlを使用
    } else {
      throw 'URLを開けませんでした: $url';
    }
  }
}
