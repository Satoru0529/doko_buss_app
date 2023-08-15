import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/stops.dart';

final stopsRef =
    FirebaseFirestore.instance.collection('stops').withConverter<Stops>(
          // Reference to the class
          /// decode
          fromFirestore: (snapshot, _) => Stops.fromJson(snapshot.data()!),

          /// encode
          toFirestore: (value, _) => value.toJson(),
        );
