import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stop_times/stop_times.dart';
import '../model/stops/stops.dart';
import '../model/trips/trips.dart';

final stopsRef = FirebaseFirestore.instance.collection('stops').withConverter(
      fromFirestore: (snapshot, _) => Stops.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );

final stopTimesRef =
    FirebaseFirestore.instance.collection('stop_times').withConverter(
          fromFirestore: (snapshot, _) => StopTimes.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );

final tripsRef = FirebaseFirestore.instance.collection('trips').withConverter(
      fromFirestore: (snapshot, _) => Trips.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
