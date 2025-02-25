import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';
import 'package:yumemi_flutter_codecheck/view/components/molecules/sort_button.dart';

/// 検索バー
///
/// 検索アイコン、検索TextField、ソートボタン
class SearchInputBar extends StatefulWidget {
  const SearchInputBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  final TextEditingController searchController;
  final void Function(String, String) onSearch;

  @override
  State<SearchInputBar> createState() => _SearchInputBarState();
}

class _SearchInputBarState extends State<SearchInputBar> {
  String selectedSort = 'stars';

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
          key: const Key("SearchTextField"),
          controller: widget.searchController,
          onSubmitted: (text) => widget.onSearch(text, selectedSort),
          textAlignVertical: TextAlignVertical(y: 0),
          decoration: InputDecoration(
            // 検索アイコン
            prefixIcon: const Icon(Icons.search),
            // 並び替えボタン
            suffixIcon: SortButton(
              onSelected: (String value) {
                widget.onSearch(widget.searchController.text, value);
                setState(() {
                  selectedSort = value;
                });
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
