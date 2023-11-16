import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../provider/latlng/latlng_notifier.dart';
import '../../provider/map_create/map_create_notifier.dart';
import '../../provider/polyline/polyline_notifier.dart';
import '../../provider/stops/stops_notifier.dart';
import '../../provider/zoom/zoom_notifier.dart';
import 'time_table_widget.dart';

class GoogleMapWidget extends ConsumerWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stops = ref.watch(StopsNotifierProvider(context));
    final stopsNotifier = ref.watch(StopsNotifierProvider(context).notifier);

    /// 現在地を取得
    final location = ref.watch(latLngNotifierProvider);

    /// 路線図を表示
    final polyline = ref.watch(polylineProviderProvider(context));

    final mapController = ref.watch(cameraMoveNotifierProvider);

    final mapNotifier = ref.watch(cameraMoveNotifierProvider.notifier);

    final zoomController = ref.watch(zoomNotifierProvider);

    final zoomNotifier = ref.watch(zoomNotifierProvider.notifier);

    return location.when(
      data: (position) {
        return GoogleMap(
          onMapCreated: mapNotifier.getMapController,

          initialCameraPosition: CameraPosition(
            target: LatLng(
              position.latitude,
              position.longitude,
            ),
            zoom: 16,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,

          /// カメラが移動したらズームレベルを取得
          onCameraMoveStarted: () {
            mapController!.getZoomLevel().then(
              (value) {
                zoomNotifier.changeZoom(value, context);
              },
            );
          },

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
                    /// TODO バス停かバスの現在地かの判定を厳密にする
                    if (stop.stopId != 'busLocation') {
                      return Marker(
                        markerId: MarkerId(stop.stopId),
                        position: LatLng(stop.stopLat, stop.stopLon),

                        /// TODO icon の設定をスマートにする
                        icon: Platform.isIOS
                            ? stopsNotifier.iosBussStopIcon!
                            : stopsNotifier.androidBussStopIcon!,
                        infoWindow: InfoWindow(
                          title: stop.stopName,
                        ),
                        onTap: () {
                          // マーカーがタップされたらテキストフィールドのフォーカスを外す
                          FocusScope.of(context).unfocus();
                          // マーカーがタップされたらモーダルを表示
                          // ignore: inference_failure_on_function_invocation
                          showMaterialModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (context) => TimeTableModalSheet(
                              stop: stop,
                            ),
                          );
                        },
                      );
                    }
                    return Marker(
                      markerId: MarkerId(stop.stopId),
                      position: LatLng(stop.stopLat, stop.stopLon),
                      icon: Platform.isIOS
                          ? stopsNotifier.iosBussLocationIcon!
                          : stopsNotifier.androidBussStopIcon!,
                      infoWindow: InfoWindow(
                        title: stop.stopName,
                      ),
                      onTap: () {
                        // マーカーがタップされたらテキストフィールドのフォーカスを外す
                        FocusScope.of(context).unfocus();
                        // マーカーがタップされたらモーダルを表示
                        // ignore: inference_failure_on_function_invocation
                        showMaterialModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (context) => TimeTableModalSheet(
                            stop: stop,
                          ),
                        );
                      },
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
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
