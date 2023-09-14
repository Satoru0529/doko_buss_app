import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeTableModalSheet extends ConsumerWidget {
  const TimeTableModalSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'バス停名',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            CustomCard(
              title: 'バス停A',
              leadingText: '09:00',
            ),
            CustomCard(
              title: 'バス停B',
              leadingText: '09:30',
            ),
            CustomCard(
              title: 'バス停C',
              leadingText: '10:00',
            ),
            CustomCard(
              title: 'バス停D',
              leadingText: '10:30',
            ),
            CustomCard(
              title: 'バス停E',
              leadingText: '10:45',
            ),
          ],
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
      margin: const EdgeInsets.all(8), // カード間の余白
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
