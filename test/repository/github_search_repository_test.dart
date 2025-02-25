import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/model/api_result.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';
import 'package:yumemi_flutter_codecheck/repository/github_search_repository.dart';

import 'github_search_repository_mock_data.dart';
import 'github_search_repository_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  final MockClient client = MockClient();
  final GithubSearchRepository target = GithubSearchRepository(client: client);

  group('repository test', () {
    test('getRepoInfo test', () async {
      // mockデータ
      const mockData = GithubSearchRepositoryMockData.jsonData;
      // mockClientは、getされた場合、上記のmockデータを返す
      when(
        client.get(any),
      ).thenAnswer((_) async => http.Response(mockData, 200));

      // 上記のmockデータが返され、正しくモデルクラスにパースされることの確認
      final expectedResult = ApiResult<RepoInfo>(
        data: RepoInfo.fromJson(jsonDecode(mockData) as Map<String, dynamic>),
        result: RequestResult.success,
      );
      final actualResult = await target.getRepoInfo(searchText: "", sort: "");

      // 取得されたrepositoryデータの確認
      expect(actualResult.data, expectedResult.data);
      // 実行結果(ApiResult)の確認
      expect(actualResult.result, expectedResult.result);
    });
    test('error response test', () async {
      const emptyData = GithubSearchRepositoryMockData.emptyJsonData;

      // mockClientは、getされた場合、statusCode:404のデータを返す
      when(
        client.get(any),
      ).thenAnswer((_) async => http.Response(emptyData, 404));

      // 上記のmockデータが返され、正しくモデルクラスにパースされることの確認
      final expectedResult = ApiResult<RepoInfo>(
        data: RepoInfo(totalCount: 0, items: []),
        result: RequestResult.apiError,
        statasCode: 404,
      );
      final actualResult = await target.getRepoInfo(searchText: "", sort: "");

      // 取得されたrepositoryデータの確認
      expect(actualResult.data, expectedResult.data);
      // 実行結果(ApiResult)の確認
      expect(actualResult.result, expectedResult.result);
      expect(actualResult.statasCode, expectedResult.statasCode);
    });
  });
}
