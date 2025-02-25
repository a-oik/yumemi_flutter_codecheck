import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/l10n/l10n.dart';

/// 検索画面の設定ボタン
///
/// タップ時、タップ可能な選択肢を表示する
class SearchSettingButton extends StatelessWidget {
  const SearchSettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.settings),
      onSelected: (String value) {
        switch (value) {
          case 'showLicense':
            // ライセンス画面に遷移
            showLicensePage(context: context);
            break;
        }
      },
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem(
              value: 'showLicense',
              child: Text(L10n.of(context)!.searchShowLicense),
            ),
          ],
    );
  }
}
