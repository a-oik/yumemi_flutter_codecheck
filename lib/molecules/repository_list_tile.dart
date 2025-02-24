import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';
import 'package:yumemi_flutter_codecheck/view/repository_detail_screen.dart';

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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RepositoryDetailScreen(
                    repoItem: item,
                  );
                },
              );            },
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
