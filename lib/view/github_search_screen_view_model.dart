import 'package:yumemi_flutter_codecheck/repository/github_repository.dart';
import 'package:yumemi_flutter_codecheck/use_case/get_repository_info_use_case.dart';

import '../model/api_result.dart';
import '../model/repo_search_input.dart';
import '../model/repository_info.dart';

class GithubSearchScreenViewModel {
  GithubSearchScreenViewModel(GetRepoInfoUseCase? getRepoInfoUseCase) {
    _getRepoInfoUseCase =
        getRepoInfoUseCase ?? GetRepoInfoUseCase(GithubSearchRepository());
  }

  late GetRepoInfoUseCase _getRepoInfoUseCase;

  Future<ApiResult<RepoInfo>> getRepoInfo({required RepoSearchInput input}) {
    return _getRepoInfoUseCase.getRepoInfo(input: input);
  }
}
