
import 'package:buss_app/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'router_path.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: mapPagePath,
    routes: [
      GoRoute(
        path: mapPagePath,
        pageBuilder: (context, state) => const MaterialPage(
          child: MapPage(),
        ),
      ),
    ],
  );
});
