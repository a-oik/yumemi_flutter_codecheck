import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_codecheck/model/repo_search_input.dart';
import 'package:yumemi_flutter_codecheck/molecules/repository_list_tile.dart';

import '../molecules/search_input_bar.dart';
import '../state_notifier/repo_info_notifier.dart';
import 'github_search_screen_view_model.dart';

class GithubSearchScreen extends ConsumerWidget {
  GithubSearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController(
    text: '',
  );

  final _viewModel = GithubSearchScreenViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoItems = ref.watch(githubRepoProvider);

    // 検索時に呼び出す
    void onSearch(String searchText) {
      ref
          .watch(githubRepoProvider.notifier)
          .searchRepo(
            RepoSearchInput(searchText: searchText, sort: "stars"),
            _viewModel,
          );
    }

    return Scaffold(
      // アプリバー
      appBar: AppBar(
        title: const Text('GitHub Search'),
        actions: [
          IconButton(
            // todo: ダークモード対応
            icon: Icon(Icons.dark_mode),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 検索バー
            SearchInputBar(
              searchController: _searchController,
              onSearch: onSearch,
            ),
            // repositoryリスト
            repoItems.when(
              data: (data) {
                // 検索結果が0件の場合の表示
                if (data.totalCount == 0) {
                  return Text("検索結果が0件です。");
                }
                // repositoryリスト表示
                return RepositoryListTile(items: data.items);
              },
              // todo: エラー時の表示実装
              error: (error, stack) => SizedBox.shrink(),
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
