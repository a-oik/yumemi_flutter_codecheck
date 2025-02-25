import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';
import 'package:yumemi_flutter_codecheck/provider/is_dark_mode_provider.dart';
import 'package:yumemi_flutter_codecheck/view/screen/github_search_screen.dart';

void main() {
  runApp(ProviderScope(child: const GitHubSearchApp()));
}

class GitHubSearchApp extends ConsumerStatefulWidget {
  const GitHubSearchApp({super.key});

  @override
  createState() => _GitHubSearchAppState();
}

class _GitHubSearchAppState extends ConsumerState<GitHubSearchApp> {

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return MaterialApp(
      // テーマ切り替え
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      home: GithubSearchScreen(),
    );
  }
}
