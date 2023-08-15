import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/map_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markersStreamProvider);
    return Scaffold(
      body: markers.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
          data: (markers) {
            return ListView.builder(
                itemCount: markers.length,
                itemBuilder: (context, index) {
                  final marker = markers[index];
                  return ListTile(
                    title: Text(marker.name),
                  );
                });
          }),
    );
  }
}
