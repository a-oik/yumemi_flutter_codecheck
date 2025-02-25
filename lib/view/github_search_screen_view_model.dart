import 'package:yumemi_flutter_codecheck/repository/github_search_repository.dart';

import '../model/api_result.dart';
import '../model/repo_search_input.dart';
import '../model/repository_info.dart';

class GithubSearchScreenViewModel {
  late GithubSearchRepository _githubRepository;

  GithubSearchScreenViewModel({GithubSearchRepository? githubRepo}) {
    _githubRepository = githubRepo ?? GithubSearchRepository();
  }

  // repositoryの検索を行う
  Future<ApiResult<RepoInfo>> getRepoInfo({
    required RepoSearchInput input,
  }) async {
    return await _githubRepository.getRepoInfo(
      searchText: input.searchText,
      sort: input.sort,
    );
  }
}
