import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/model/api_result.dart';
import 'package:yumemi_flutter_codecheck/model/repo_search_input.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';
import 'package:yumemi_flutter_codecheck/view_model/github_search_screen_view_model.dart';

/// Repository検索結果を管理するStateNotifier
///
/// repository検索時にsearchRepoメソッドを呼び出して使用
class RepoInfoNotifier extends StateNotifier<AsyncValue<RepoInfo>> {
  RepoInfoNotifier(this.ref)
    : super(const AsyncData(RepoInfo(totalCount: 0, items: [])));

  final Ref ref;

  // 検索を行う
  Future<void> searchRepo(
    RepoSearchInput input,
    GithubSearchScreenViewModel viewModel,
  ) async {
    state = AsyncLoading();
    final useCaseResult = await viewModel.getRepoInfo(input: input);

    if (useCaseResult.result == RequestResult.apiError) {
      state = AsyncValue.error({}, StackTrace.current);
      return;
    }

    state = AsyncData(useCaseResult.data);
  }
}
