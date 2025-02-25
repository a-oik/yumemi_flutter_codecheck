# 株式会社ゆめみ　Flutterコーディングテスト課題

## スクリーンショット

| ライトテーマ | ダークテーマ|
| ---- | ---- |
| <img width="336" alt="スクリーンショット 2025-02-25 3 01 19" src="https://github.com/user-attachments/assets/b771422c-57f9-4a03-8ab1-264f9c1b5cb2" /> | <img width="330" alt="スクリーンショット 2025-02-25 3 01 30" src="https://github.com/user-attachments/assets/9dd9d48f-ebbb-48b5-a65a-f5b98ebc8eb1" />|

デモ動画  
https://github.com/user-attachments/assets/3c7c41a2-5bef-48b9-b401-3dcdee9ec4f2

## 動作環境

* IDE: Android Studio Ladybug | 2024.2.1 Patch 3
* Flutter: 3.29.0
* Dart: 3.7.0
* サポートするOS  
   iOS, Android

### 動作

* 検索用のテキストを入力する
* 入力したキーワードで GitHub のリポジトリを検索できる
* 検索結果は一覧で概要（リポジトリ名、概要）を表示する
* 検索結果のレポジトリをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue
  数）を表示する

### UI/UX

* 画面回転対応
* Theme の適切な利用・ダークモードの対応
* 多言語対応 (英語、日本語)
* エラー発生時は、エラー文言を表示
* ライセンス画面を表示

## 状態管理

flutter_riverpod: 2.6.1

## 導入パッケージ紹介  
※ pub getで取得されるライブラリのバージョンが作業者によって変わってしまうことを防止するため、バージョンを固定しております。

* flutter_riverpod -状態管理
* freezed_annotation -freezedファイル生成
* http -apiの実装
* intl -言語、数字の成形
* json_annotation -jsonの変換
* flutter_localizations -多言語対応

----開発----

* flutter_test -テスト
* flutter_lints -静的解析
* build_runner -自動生成ファイルの作成
* freezed -immutableなクラス作成、json変換を簡単に
* json_serializable -jsonの変換
* mockito -データをモック化してテスト

## アーキテクチャ
MVVM, Atomic Designを採用しました。  
参考：MVVM: https://zenn.dev/goldsaya/articles/7a0d3baa645463  
     atomic design : https://zenn.dev/bizlink/articles/b5c8985af8407a  
### フォルダ構成

```
├── lib
│   ├── main.dart               # アプリのエントリーポイント
│   ├── l10n                    # 多言語対応
│   ├── model                   # APIから取得されるデータや、画面で利用するモデルクラス定義
│   ├── provider                # 状態管理用のproviderを定義
│   ├── state_notifier          # 状態管理用のstate_notifierを定義
│   ├── repository              # httpでの外部とのやりとり、メソッドの定義
│   ├── view                    # 見た目
│   │　  ├── components          # 詳細ページ（widgetも含む）
│   │    │  ├── atoms           # atoms(分割不可能なWidget)
│   │    │  ├── molecules       # molecules(複数部品の組み合わせ)
│   │    │  ├── atoms           # organisms（それ対対で1個の機能を満たすような部品）
│   │    │── screen         　　 # 画面のクラスを定義
│   ├── view_model              # ViewModel層を定義

```

## ビルド手順

・クローン

```
git clone https://github.com/a-oik/yumemi_flutter_codecheck.git
```

・依存関係を読み込む（多言語対応も読み込まれます）

```
flutter pub get
```

・freezed等のコード生成

```
flutter pub run build_runner build --delete-conflicting-outputs
```

・ビルド

```
flutter run
```

## テスト

### unitテスト
* データモデルの変換テスト
* データ取得メソッドのテスト

### widgetテスト

* 多言語対応のテスト(初期表示時)
* ワード検索したら、想定の内容が表示されるか
* 検索フォームのテスト

## アピールポイント

* issueでタスク管理をしました。
* プルリクエストを利用してで開発をして、安全に運用しました。
* widgetをコンポーネント化し、Viewファイル全体の見通しをよくしました。
* コミットメッセージにissue番号を#XX で記載し、Git履歴からissueを遡れるようにしました。
* FutureProviderを使用してローディング・エラー表示をシンプルに実装しました。
* コメントでコードを読みやすいようにしました。
* 並び替え機能を実装しました。
* テストコードの拡張性のため、各クラスで利用するデータ取得クラス(repository層やhttpクライアント等)をDIできるようにしました。
* シンプルで使いやすい、スタイリッシュなデザインを意識しました。
* 多言語対応はOSの言語設定を反映し、アプリ内では操作できないようにしました。

## 時間の都合で実装できなかったこと
* Githubのレポジトリページに飛ぶボタン等の実装
* 不具合修正 issue #28
* Dotenvライブラリを利用し、デプロイ環境を分けられるようにする
* Github actionsを使用して、プッシュを行う度にコードフォーマット・テストコード実行できるようにする




