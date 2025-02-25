import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';
import 'package:yumemi_flutter_codecheck/repository/github_search_repository.dart';
import 'package:yumemi_flutter_codecheck/view/github_search_screen.dart';

import 'dart:io';

import 'package:yumemi_flutter_codecheck/view/github_search_screen_view_model.dart';

import '../repository/github_search_repository_mock_data.dart';
import 'github_search_screen_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  setUpAll(() {
    // ダミーの HTTP オーバーライド
    HttpOverrides.global = _MockHttpOverrides(); // MockHttpOverrides を設定
  });

  /// 検索画面の表示(言語(Localeを渡す))
  displayGithubSearchScreenByLocale({
    required WidgetTester tester,
    required Locale locale,
    GithubSearchScreenViewModel? viewmodel,
  }) async {
    if (locale.languageCode == "ja") {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: GithubSearchScreen(viewModel: viewmodel),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            locale: Locale("ja"),
          ),
        ),
      );
    } else {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: GithubSearchScreen(),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            locale: Locale("en"),
          ),
        ),
      );
    }
    await tester.pumpAndSettle();
  }

  /// 描画するWidgetの確認
  group("display Widget test", () {
    // 日本語文言確認
    testWidgets("text test ja", (WidgetTester tester) async {
      await displayGithubSearchScreenByLocale(
        tester: tester,
        locale: const Locale("ja"),
      );
      expect(find.text("レポジトリ検索"), findsOneWidget);
      expect(find.text("レポジトリ名"), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });
    // 英語文言確認
    testWidgets("text test en", (WidgetTester tester) async {
      await displayGithubSearchScreenByLocale(
        tester: tester,
        locale: const Locale("en"),
      );
      expect(find.text("Search Repositories"), findsOneWidget);
      expect(find.text("repository name"), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.light_mode), findsOneWidget);
    });
  });

  /// 入力フォームの試験
  group("search input form test", () {
    testWidgets("入力 → テキスト削除", (WidgetTester tester) async {
      await displayGithubSearchScreenByLocale(
        tester: tester,
        locale: Locale("ja"),
      );

      // 'flutter'を入力
      await tester.enterText(
        find.byKey(const Key("SearchTextField")),
        "flutter",
      );
      expect(find.text("flutter"), findsOneWidget);
      // テキストを削除した場合、hintTextが表示されることの確認
      await tester.enterText(find.byKey(const Key("SearchTextField")), "");
      expect(find.text("レポジトリ名"), findsOneWidget);
    });
  });

  /// 検索結果の表示
  group("search result test", () {
    testWidgets("search result test", (WidgetTester tester) async {
      final mockClient = MockClient();
      final mockViewModel = GithubSearchScreenViewModel(
        githubRepo: GithubSearchRepository(client: mockClient),
      );
      // mockデータ
      const mockData = GithubSearchRepositoryMockData.jsonData;
      // mockClientは、getされた場合、上記のmockデータを返す
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response(mockData, 200));

      await displayGithubSearchScreenByLocale(
        tester: tester,
        locale: Locale("ja"),
        viewmodel: mockViewModel,
      );

      // 'flutter'を入力
      await tester.enterText(
        find.byKey(const Key("SearchTextField")),
        "flutter",
      );
      expect(find.text("flutter"), findsOneWidget);
      // キーボードを表示
      await tester.showKeyboard(find.byKey(const Key("SearchTextField")));
      // 入力を完了
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // 検索結果が表示されていることの確認
      expect(find.text("flutter/flutter"), findsOneWidget);
      expect(find.text("Flutter makes it easy and fast to build beautiful apps for mobile and beyond"), findsOneWidget);
      expect(find.text("flutter/samples"), findsOneWidget);
      expect(find.text("A collection of Flutter examples and demos"), findsOneWidget);
    });
  });
}

/// ダミーの HTTP オーバーライド
///
/// テストコード中ではネットワークリクエストが実行されず、NetworkImageの描画で落ちてしまう事象の解消のため
class _MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}
