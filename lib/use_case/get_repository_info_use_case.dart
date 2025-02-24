
import 'package:yumemi_flutter_codecheck/model/api_result.dart';
import 'package:yumemi_flutter_codecheck/model/repo_search_input.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';
import 'package:yumemi_flutter_codecheck/repository/github_repository.dart';

class GetRepoInfoUseCase {
  late GithubSearchRepository _githubRepository;

  GetRepoInfoUseCase(GithubSearchRepository? githubRepo) {
    _githubRepository = githubRepo ?? GithubSearchRepository();
  }

  Future<ApiResult<RepoInfo>> getRepoInfo({
    required RepoSearchInput input,
  }) async {
    return await _githubRepository.getRepoInfo(
      searchText: input.searchText,
      sort: input.sort,
    );
  }
}
