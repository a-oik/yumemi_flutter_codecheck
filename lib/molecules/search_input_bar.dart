import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';

/// 検索バー
///
/// 検索アイコン、検索TextField、ソートボタン
class SearchInputBar extends StatelessWidget {
  const SearchInputBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  final TextEditingController searchController;
  final void Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextField(
          controller: searchController,
          onSubmitted: (text) => onSearch(text),
          textAlignVertical: TextAlignVertical(y: 0),
          decoration: InputDecoration(
            // 検索アイコン
            prefixIcon: const Icon(Icons.search),
            // 並び替えボタン
            suffixIcon: IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {
                // todo:sort切り替え
              },
            ),
            hintText: L10n.of(context)!.searchTextFieldHintText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
