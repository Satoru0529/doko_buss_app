import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stops/stops.dart';

final stopsRef = FirebaseFirestore.instance.collection('stops').withConverter(
      fromFirestore: (snapshot, _) => Stops.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
