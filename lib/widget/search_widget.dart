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
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'バス停を検索',
              filled: true,
              isDense: true,
              fillColor: const Color.fromARGB(248, 231, 235, 241),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () async {
                  searchEditingController.clear();
                  await searchNotifier.searchStop('', context);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            maxLength: 10,
            controller: searchEditingController,
            onChanged: (text) async {
              await searchNotifier.searchStop(text, context);
            },
            cursorColor: Colors.grey,
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
            return Card(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final stop = list[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(stop.stopName),
                        onTap: () async {
                          /// latLngNotifier に選択したバス停の位置情報を渡す
                          await latLngNotifier.searchPosition(stop);
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
