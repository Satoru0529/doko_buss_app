import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/stops/stops.dart';
import '../../utils/text_utils.dart';

part 'search_provider.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  FutureOr<List<Stops>> build() {
    return [];
  }

  List<String> biGramList = [];

  Future<void> searchStop(String input) async {
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
          final biGramList = TextUtils.tokenize(words);

          /// テキスト検索where句を追加
          Query query = FirebaseFirestore.instance.collection('stops');
          for (final word in this.biGramList) {
            query = query.where('biGramMap.$word', isEqualTo: true);
          }

          /// 作成したクエリで取得する
          final snap = await query.get();
          final searchStops = snap.docs.map((_) => const Stops()).toList();
          state = AsyncValue.data(searchStops);
        }
      },
    );
  }
}
