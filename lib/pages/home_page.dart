import 'package:buss_app/controller/io_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textNotifier = ref.watch(ioControllerProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  textNotifier.loadAssetTrips(context);
                },
                child: const Text('Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}