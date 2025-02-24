import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Themeを管理。ダークモードの場合true
final isDarkModeProvider = StateProvider<bool>((ref) => false);
