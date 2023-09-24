import 'package:buss_app/widget/google_map_widget.dart';
import 'package:buss_app/widget/speed_dial_fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/search_widget.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Focus(
      focusNode: FocusNode(),
      child: GestureDetector(
        onTap: FocusNode().requestFocus,
        child: const Scaffold(
          resizeToAvoidBottomInset: false,

          /// Stack を採用
          /// マップを一番下にして、検索バーやボタンを上に重ねる
          body: Stack(
            children: [
              /// GoogleMap
              GoogleMapWidget(),

              /// 検索 widget
              SearchWidget(),

              /// SpeedDial FAB
              SpeedDialFabWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
