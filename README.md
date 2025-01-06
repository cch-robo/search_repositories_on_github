# search_repositories_on_github

GitHub 検索用 REST API エンドポイントを利用して、
GitHub 公開リポジトリをクエリを使って検索するアプリです。

## 機能要件

- 入力したキーワードで GitHub のリポジトリを検索できること。
- GitHub のリポジトリを検索する際、GitHub API（[search/repositories](https://github.com/yumemi-inc/flutter-engineer-codecheck#:~:text=%E9%9A%9B%E3%80%81GitHub%20API%EF%BC%88-,search/repositories,-%EF%BC%89%E3%82%92%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B)）を利用すること。
- GitHub API 呼び出しプロセスは、独自の処理を提示して既存ツールを使わないこと。
- 検索結果は一覧で概要（リポジトリ名）を表示すること。
- 検索結果のアイテムをタップで、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示すること。

## 開発環境前提
### 開発プラットフォーム OS
ios/Android アプリをビルドする必要性から macOS を想定しています。
