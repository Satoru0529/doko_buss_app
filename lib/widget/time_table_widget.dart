import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/stops/stops.dart';

class TimeTableModalSheet extends ConsumerWidget {
  const TimeTableModalSheet({super.key, required this.stop});
  final Stops stop;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 600,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                child: Container(
                  width: 100,
                  height: 5,
                  decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      stop.stopName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomCard(
                title: '荒手路線',
                leadingText: '09:00',
              ),
              const CustomCard(
                title: '枝光路線',
                leadingText: '09:30',
              ),
              const CustomCard(
                title: '荒手路線',
                leadingText: '10:00',
              ),
              const CustomCard(
                title: '枝光路線',
                leadingText: '10:30',
              ),
              const CustomCard(
                title: '荒手路線',
                leadingText: '10:45',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    required this.leadingText,
    super.key,
  });
  final String title;
  final String leadingText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // 丸い形状
      ),
      margin: const EdgeInsets.all(5), // カード間の余白
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        leading: Text(
          leadingText,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
