import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/stops/stops.dart';

final mapControllerProvider = Provider<GoogleMapController?>(
  (ref) {
    // GoogleMapControllerの初期化はStartPage内で行うため、ここではnullを返します
    return null;
  },
);

final cameraPositionProvider = Provider<CameraPosition>(
  (ref) {
    return const CameraPosition(
      target: LatLng(38.7812934, 140.2464705),
      zoom: 13,
    );
  },
);

final markersStreamProvider = StreamProvider<List<Stops>>(
  (ref) {
    /// stops コレクションのドキュメントを全て取得
    final collection = FirebaseFirestore.instance.collection('stops');

    /// CollectionReference 型で受け取った値を、Stream<List<Stops>> 型で返す
    return collection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (doc) {
              final data = doc.data();
              return Stops.fromJson(
                {
                  ...data,
                  'id': doc.id, // ドキュメントのIDを追加
                },
              );
            },
          ).toList(),
        );
  },
);
