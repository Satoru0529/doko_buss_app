import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// テーマモードの状態
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
