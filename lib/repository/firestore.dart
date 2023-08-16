import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stop_times/stop_times.dart';
import '../model/stops/stops.dart';
import '../model/trips/trips.dart';

final stopsRef =
    FirebaseFirestore.instance.collection('stops').withConverter<Stops>(
          // Reference to the class
          /// decode
          fromFirestore: (snapshot, _) => Stops.fromJson(snapshot.data()!),

          /// encode
          toFirestore: (value, _) => value.toJson(),
        );

final stopTimesRef = FirebaseFirestore.instance
    .collection('stop_times')
    .withConverter<StopTimes>(
      // Reference to the class
      /// decode
      fromFirestore: (snapshot, _) => StopTimes.fromJson(snapshot.data()!),

      /// encode
      toFirestore: (value, _) => value.toJson(),
    );

final tripsRef =
    FirebaseFirestore.instance.collection('trips').withConverter<Trips>(
          // Reference to the class
          /// decode
          fromFirestore: (snapshot, _) => Trips.fromJson(snapshot.data()!),

          /// encode
          toFirestore: (value, _) => value.toJson(),
        );
