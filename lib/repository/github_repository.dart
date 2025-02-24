import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yumemi_flutter_codecheck/model/api_result.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';

class GithubSearchRepository {
  GithubSearchRepository({http.Client? client}) {
    _client = client ?? http.Client();
  }

  late http.Client _client;

  // 検索文字列を渡して、github上のrepositoryを検索する
  Future<ApiResult<RepoInfo>> getRepoInfo({
    required String searchText,
    required String sort,
    int page = 1,
  }) async {
    try {
      //
      final resUrl =
          'https://api.github.com/search/repositories?q=$searchText&sort=$sort&page=$page&per_page=20';

      final apiUrl = Uri.parse(Uri.encodeFull(resUrl));
      http.Response response = await _client
          .get(apiUrl)
          .timeout(const Duration(seconds: 30));

      final jsonData = json.decode(response.body);
      final parsedData = RepoInfo.fromJson(jsonData);
      return ApiResult(
        result: RequestResult.success,
        data: parsedData,
      );
    } catch (e) {
      return ApiResult(
        result: RequestResult.apiError,
        data: RepoInfo(totalCount: 0, items: []),
      );
    }
  }
}
