import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';
import 'package:yumemi_flutter_codecheck/organisms/repo_info_icon_list.dart';

import '../atoms/close_button.dart';

/// Repositoryの詳細を表示する画面
///
/// 以下を表示
/// リポジトリ名、オーナーアイコン、プロジェクト言語、Star数、Watcher 数、Fork数、Issue数
class RepositoryDetailScreen extends StatelessWidget {
  final RepoDataItems repoItem;

  const RepositoryDetailScreen({super.key, required this.repoItem});

  @override
  Widget build(BuildContext context) {
    final repo = repoItem;
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 48.0,
              horizontal: 32.0,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              // todo: ダークモード反映
              color: false ? Colors.black : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 作者アイコン & repository名
                Row(
                  children: [
                    SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(repo.owner.avatarUrl),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        repo.fullName,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                // 説明文
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(repo.description ?? ""),
                ),
                // アイコン群
                RepoInfoIconList(repo: repo),
                SizedBox(height: 12.0),
                // todo: 「Githubで開く」ボタンの実装
              ],
            ),
          ),
          // 閉じる(×)ボタン
          Positioned(
            right: 32.0,
            child: CloseIconButton(size: 48.0,),
          ),
        ],
      ),
    );
  }
}
