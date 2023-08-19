import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stops/stops.dart';
import '../model/trips/trips.dart';

// final stopsRef =
//     FirebaseFirestore.instance.collection('stops').withConverter<Stops>(
//           // Reference to the class
//           /// decode
//           fromFirestore: (snapshot, _) => Stops.fromJson(snapshot.data()!),

//           /// encode
//           toFirestore: (value, _) => value.toJson(),
//         );

// final stopTimesRef = FirebaseFirestore.instance
//     .collection('stop_times')
//     .withConverter<StopTimes>(
//       // Reference to the class
//       /// decode
//       fromFirestore: (snapshot, _) => StopTimes.fromJson(snapshot.data()!),

//       /// encode
//       toFirestore: (value, _) => value.toJson(),
//     );

final tripsRef = FirebaseFirestore.instance
    .collection('trips')
    .doc('yG1C3Hhg5oJHt878lqaY')
    .collection('routes')
    .withConverter<Stops>(
      // Reference to the class
      /// decode
      fromFirestore: (snapshot, _) => Stops.fromJson(snapshot.data()!),

      /// encode
      toFirestore: (value, _) => value.toJson(),
    );

// final docRef = tripsRef.doc('4HzhheaCJJVQX6pdxy3C');
// final subCoRef = docRef.collection('routes');
