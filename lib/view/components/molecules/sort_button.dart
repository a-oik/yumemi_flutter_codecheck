import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key, required this.onSelected});

  final void Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.sort                                                                                                                                                                       ),
      onSelected: onSelected,
      itemBuilder:
          (BuildContext context) => [
        PopupMenuItem(
          value: 'stars',
          child: Text(L10n.of(context)!.searchSortStars),
        ),
        PopupMenuItem(
          value: 'forks',
          child: Text(L10n.of(context)!.searchSortForks),
        ),
        PopupMenuItem(
          value: 'issues',
          child: Text(L10n.of(context)!.searchSortIssues),
        ),
        PopupMenuItem(
          value: 'updated',
          child: Text(L10n.of(context)!.searchSortUpdated),
        ),
      ],
    );
  }
}
