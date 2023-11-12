/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGen {
  const $AssetsGen();

  $AssetsImagesGen get images => const $AssetsImagesGen();
}

class $EdamitsuGen {
  const $EdamitsuGen();

  /// File path: edamitsu/agency.txt
  String get agency => 'edamitsu/agency.txt';

  /// File path: edamitsu/agency_jp.txt
  String get agencyJp => 'edamitsu/agency_jp.txt';

  /// File path: edamitsu/arate.txt
  String get arate => 'edamitsu/arate.txt';

  /// File path: edamitsu/bus_location.txt
  String get busLocation => 'edamitsu/bus_location.txt';

  /// File path: edamitsu/calendar.txt
  String get calendar => 'edamitsu/calendar.txt';

  /// File path: edamitsu/calendar_dates.txt
  String get calendarDates => 'edamitsu/calendar_dates.txt';

  /// File path: edamitsu/edamitsu.txt
  String get edamitsu => 'edamitsu/edamitsu.txt';

  /// File path: edamitsu/fare_attributes.txt
  String get fareAttributes => 'edamitsu/fare_attributes.txt';

  /// File path: edamitsu/fare_rules.txt
  String get fareRules => 'edamitsu/fare_rules.txt';

  /// File path: edamitsu/feed_info.txt
  String get feedInfo => 'edamitsu/feed_info.txt';

  /// File path: edamitsu/hinode.txt
  String get hinode => 'edamitsu/hinode.txt';

  /// File path: edamitsu/routes.txt
  String get routes => 'edamitsu/routes.txt';

  /// File path: edamitsu/sannou.txt
  String get sannou => 'edamitsu/sannou.txt';

  /// File path: edamitsu/sannou_fujimi.txt
  String get sannouFujimi => 'edamitsu/sannou_fujimi.txt';

  /// File path: edamitsu/shapes.txt
  String get shapes => 'edamitsu/shapes.txt';

  /// File path: edamitsu/stop_times.txt
  String get stopTimes => 'edamitsu/stop_times.txt';

  /// File path: edamitsu/stops.txt
  String get stops => 'edamitsu/stops.txt';

  /// File path: edamitsu/translations.txt
  String get translations => 'edamitsu/translations.txt';

  /// File path: edamitsu/trips.txt
  String get trips => 'edamitsu/trips.txt';

  /// List of all assets
  List<String> get values => [
        agency,
        agencyJp,
        arate,
        busLocation,
        calendar,
        calendarDates,
        edamitsu,
        fareAttributes,
        fareRules,
        feedInfo,
        hinode,
        routes,
        sannou,
        sannouFujimi,
        shapes,
        stopTimes,
        stops,
        translations,
        trips
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: Assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('Assets/images/app_icon.png');

  /// File path: Assets/images/app_icon_simple.png
  AssetGenImage get appIconSimple =>
      const AssetGenImage('Assets/images/app_icon_simple.png');

  /// File path: Assets/images/buss_icon_android.png
  AssetGenImage get bussIconAndroid =>
      const AssetGenImage('Assets/images/buss_icon_android.png');

  /// File path: Assets/images/buss_icon_ios.png
  AssetGenImage get bussIconIos =>
      const AssetGenImage('Assets/images/buss_icon_ios.png');

  /// File path: Assets/images/map_screen.jpg
  AssetGenImage get mapScreen =>
      const AssetGenImage('Assets/images/map_screen.jpg');

  /// File path: Assets/images/stop_icon_android.png
  AssetGenImage get stopIconAndroid =>
      const AssetGenImage('Assets/images/stop_icon_android.png');

  /// File path: Assets/images/stop_icon_android_1.png
  AssetGenImage get stopIconAndroid1 =>
      const AssetGenImage('Assets/images/stop_icon_android_1.png');

  /// File path: Assets/images/stop_icon_android_2.png
  AssetGenImage get stopIconAndroid2 =>
      const AssetGenImage('Assets/images/stop_icon_android_2.png');

  /// File path: Assets/images/stop_icon_ios.png
  AssetGenImage get stopIconIos =>
      const AssetGenImage('Assets/images/stop_icon_ios.png');

  /// File path: Assets/images/stop_icon_ios_1.png
  AssetGenImage get stopIconIos1 =>
      const AssetGenImage('Assets/images/stop_icon_ios_1.png');

  /// File path: Assets/images/stop_icon_ios_2.png
  AssetGenImage get stopIconIos2 =>
      const AssetGenImage('Assets/images/stop_icon_ios_2.png');

  /// File path: Assets/images/stop_times_sheet.jpg
  AssetGenImage get stopTimesSheet =>
      const AssetGenImage('Assets/images/stop_times_sheet.jpg');

  /// File path: Assets/images/stops_sheet.jpg
  AssetGenImage get stopsSheet =>
      const AssetGenImage('Assets/images/stops_sheet.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        appIcon,
        appIconSimple,
        bussIconAndroid,
        bussIconIos,
        mapScreen,
        stopIconAndroid,
        stopIconAndroid1,
        stopIconAndroid2,
        stopIconIos,
        stopIconIos1,
        stopIconIos2,
        stopTimesSheet,
        stopsSheet
      ];
}

class Assets {
  Assets._();

  static const $AssetsGen assets = $AssetsGen();
  static const $EdamitsuGen edamitsu = $EdamitsuGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
