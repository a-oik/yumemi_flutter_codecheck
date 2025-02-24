import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';
import 'package:yumemi_flutter_codecheck/view/github_search_screen.dart';

void main() {
  runApp(ProviderScope(child: const GitHubSearchApp()));
}

class GitHubSearchApp extends StatefulWidget {
  const GitHubSearchApp({super.key});

  @override
  createState() => _GitHubSearchAppState();
}

class _GitHubSearchAppState extends State<GitHubSearchApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      // todo: Dark Mode対応
      home: GithubSearchScreen(),
    );
  }
}
