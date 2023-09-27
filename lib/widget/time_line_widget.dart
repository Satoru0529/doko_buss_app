import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timelines/timelines.dart';

import '../model/stops/stops.dart';

class TimeLine {
  TimeLine({required this.time, required this.stopName});
  final String time;
  final String stopName;
}

class TimeLineModalSheet extends ConsumerWidget {
  TimeLineModalSheet({super.key, required this.stop});
  final Stops stop;

  final List<TimeLine> mockList = [
    TimeLine(time: '13:45', stopName: '枝光公園'),
    TimeLine(time: '14:00', stopName: 'ローソン宮田町店前'),
    TimeLine(time: '14:15', stopName: '枝光三丁目バス通り'),
    TimeLine(time: '14:30', stopName: '枝光小学校前'),
    TimeLine(time: '14:45', stopName: '枝光小学校裏'),
    TimeLine(time: '15:00', stopName: '枝光四丁目東公園入口'),
    TimeLine(time: '15:15', stopName: 'エメラルドタウン前'),
    TimeLine(time: '15:30', stopName: '田原整形外科前'),
    TimeLine(time: '15:45', stopName: '枝光'),
    TimeLine(time: '16:00', stopName: '刀根商店前'),
    TimeLine(time: '16:15', stopName: '藤吉寝具センター前'),
    TimeLine(time: '16:30', stopName: '諸富医院前'),
    TimeLine(time: '16:45', stopName: '光タクシー前'),
    TimeLine(time: '17:00', stopName: '枝光本町バス停'),
    TimeLine(time: '17:15', stopName: '枝光本町商店街'),
  ];

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
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_down,
                      color: Colors.white,
                    ),
                    Text(
                      '枝光路線',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: Text(
                              '遅延',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '混雑',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 410,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: FixedTimeline.tileBuilder(
                      theme: TimelineThemeData(
                        nodePosition: 0.15,
                        color: Colors.blueGrey,
                        connectorTheme: const ConnectorThemeData(
                          thickness: 2,
                        ),
                      ),
                      builder: TimelineTileBuilder.connected(
                        indicatorBuilder: (context, index) {
                          return index != mockList.length - 1
                              ? const OutlinedDotIndicator()
                              : ContainerIndicator(
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    color: Colors.blueGrey,
                                  ),
                                );
                        },
                        connectorBuilder: (_, index, connectorType) {
                          return SolidLineConnector(
                            indent:
                                connectorType == ConnectorType.start ? 0 : 2.0,
                            endIndent:
                                connectorType == ConnectorType.end ? 0 : 2.0,
                            //color: color,
                          );
                        },
                        contentsBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(mockList[index].stopName),
                        ),
                        oppositeContentsBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(mockList[index].time),
                        ),
                        itemExtentBuilder: (_, __) {
                          return 50;
                        },
                        itemCount: mockList.length,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
