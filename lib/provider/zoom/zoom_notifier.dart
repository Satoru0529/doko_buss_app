import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zoom_notifier.g.dart';

/// 画面のズームレンズを管理する
@riverpod
class ZoomNotifier extends _$ZoomNotifier {
  @override
  FutureOr<double> build() {
    return state.when(
      data: (data) => data,
      loading: () => 0,
      error: (_, __) => 0,
    );
  }

  Future<void> changeZoom(double zoom) async {
    state = const AsyncValue.loading();

    if (zoom < 16) {
      print('aaa');
    } else {
      print('bbb');
    }
    state = AsyncValue.data(zoom);
  }
}
