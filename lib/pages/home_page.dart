import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/io_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(ioControllerProvider);
    final textNotifier = ref.watch(ioControllerProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  textNotifier.loadAssetTripsRoutes(context);
                },
                child: const Text('Text'),
              ),
              Text(text.value ?? 'No Data'),
            ],
          ),
        ),
      ),
    );
  }
}
