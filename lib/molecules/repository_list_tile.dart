import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';

/// repository情報のリストタイル
class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key, required this.items});

  final List<RepoDataItems> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              // todo: repositoryの詳細情報を表示する
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(item.owner.avatarUrl),
              ),
              title: Text(item.fullName),
              subtitle: Text(item.description ?? ''),
            ),
          );
        },
      ),
    );
  }
}
