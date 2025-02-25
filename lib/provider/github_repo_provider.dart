import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';
import 'package:yumemi_flutter_codecheck/state_notifier/repo_info_notifier.dart';

/// Repository検索結果を管理するprovider
final githubRepoProvider =
StateNotifierProvider.autoDispose<RepoInfoNotifier, AsyncValue<RepoInfo>>(
      (ref) => RepoInfoNotifier(ref),
);