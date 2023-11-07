import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_editing_controller_provider.g.dart';

// final searchTextEditingController = Provider.autoDispose<TextEditingController>(
//   (ref) => TextEditingController(),
// );

@riverpod
class SearchTextControllerNotifier extends _$SearchTextControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}
