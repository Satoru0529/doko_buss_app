import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zoom_notifier.g.dart';

/// 画面のズームレンズを管理する
@riverpod
class ZoomNotifier extends _$ZoomNotifier {
  @override
  FutureOr<double> build() {
    return 16;
  }

  Future<void> changeZoom(double zoom) async {
    state = AsyncValue.data(zoom);
  }
}
