import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/latlng/latlng_provider.dart';
import '../provider/search/search_provider.dart';
import '../provider/stops/stops_notifier.dart';
import '../provider/text_editing_controller_provider.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// edamitsu/stops.txt から取得したバス停のリスト
    final stops = ref.watch(StopsNotifierProvider(context));

    /// TextEditingController <= これいらん
    final searchEditingController = ref.watch(searchTextEditingController);

    /// 検索した際に検索ヒットしたバス停のリスト
    final searchList = ref.watch(searchNotifierProvider);

    /// 検索メソッド
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

    /// フォーカスする位置を監視する
    final latLngNotifier = ref.watch(latLngNotifierProvider.notifier);

    /// 検索バー
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 3,
                  color: Colors.black26,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'バス停を検索',
                filled: true,
                isDense: true,
                fillColor: Colors.white,
                counterText: '',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchEditingController.text.isEmpty
                    ? const SizedBox()
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () async {
                          searchEditingController.clear();
                          await searchNotifier.searchStop('', context);
                        },
                      ),
                border: InputBorder.none, // 枠線なし
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // 枠線なし
                  borderRadius: BorderRadius.circular(32),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // 枠線なし
                  borderRadius: BorderRadius.circular(32),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // 枠線なし
                  borderRadius: BorderRadius.circular(32),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // 枠線なし
                  borderRadius: BorderRadius.circular(32),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              maxLength: 10,
              controller: searchEditingController,
              onChanged: (text) async {
                await searchNotifier.searchStop(text, context);
              },
              cursorColor: Colors.grey,
            ),
          ),
        ),

        /// 検索結果を表示
        searchList.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          data: (list) {
            /// 検索結果がない場合は表示しない
            if (list.isEmpty) {
              return const SizedBox(
                height: 0,
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8),

              /// Card の高さを固定しているが検索リストの量によって高さを調節できるようにしたい
              child: SizedBox(
                height: 250,
                child: Card(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final stop = list[index];
                      return ListTile(
                        title: Text(stop.stopName),
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          /// 検索リストをタップした際に、textFiled の文字をクリアする
                          await searchNotifier.searchStop('', context);

                          /// 検索リストをタップした際に textEditingController に選択したバス停の名前を渡す
                          searchEditingController.text = stop.stopName;

                          /// latLngNotifier に選択したバス停の位置情報を渡す
                          await latLngNotifier.searchPosition(stop);
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
