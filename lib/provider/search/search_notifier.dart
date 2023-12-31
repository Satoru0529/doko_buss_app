import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/stops/stops.dart';
import '../../util/text_utils.dart';
import '../stops/stops_notifier.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  FutureOr<List<Stops>> build() {
    return [];
  }

  List<Stops> searchStops = <Stops>[];
  List<String> biGramList = <String>[];

  Future<void> searchStop(String input, BuildContext context) async {
    state = const AsyncValue.loading();

    await AsyncValue.guard(
      () async {
        /// 検索文字数が2文字に満たない場合は検索を行わず、検索結果のリストを空にする
        if (input.length < 2) {
          state = const AsyncValue.data([]);
        } else {
          /// 空白除去して配列にする
          final words = input.trim().split(' ');

          /// 文字列のリストを渡して、bi-gram を実行
          biGramList = TextUtils.tokenize(words);

          final stops = ref.watch(stopsNotifierProvider(context)).value;

          for (final word in biGramList) {
            searchStops =
                stops!.where((stop) => stop.biGramMap[word] == true).toList();
          }

          state = AsyncValue.data(searchStops);
        }
      },
    );
  }
}
