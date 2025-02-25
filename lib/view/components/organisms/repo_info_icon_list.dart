import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';
import 'package:yumemi_flutter_codecheck/model/repository_info.dart';

import '../molecules/icon_with_description.dart';

/// repositoryのアイコン群
class RepoInfoIconList extends StatelessWidget {
  const RepoInfoIconList({super.key, required this.repo});

  final RepoDataItems repo;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 4.0,
      children: [
        IconWithDescription(
          icon: Icon(Icons.star, color: Colors.yellow),
          description: "${repo.stargazersCount} ${L10n.of(context)!.searchDetailStars}",
        ),
        IconWithDescription(
          icon: Icon(Icons.call_split, color: Colors.blue),
          description: "${repo.forksCount} ${L10n.of(context)!.searchDetailForks}",
        ),
        IconWithDescription(
          icon: Icon(Icons.bug_report, color: Colors.deepOrange),
          description: "${repo.openIssuesCount} ${L10n.of(context)!.searchDetailIssues}",
        ),
        IconWithDescription(
          icon: Icon(Icons.sticky_note_2_outlined, color: Colors.grey),
          description: "${L10n.of(context)!.searchDetailLanguage} ${repo.language}",
        ),
        IconWithDescription(
          icon: Icon(Icons.people, color: Colors.indigo),
          description: "${repo.watchersCount} ${L10n.of(context)!.searchDetailWatchers}",
        ),
      ],
    );
  }
}
