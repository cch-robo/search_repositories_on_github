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
- ios/Android アプリをビルドする必要性から macOS を想定しています。

### 開発環境 IDE
- 最新の Android Studio Ladbug の利用を想定しています。  
  _Android Studio Ladybug | 2024.2.1 Patch 3 を利用しました。_
- 最新の Xcode の利用を想定しています。  
  _Version 16.2 (16C5032a) intel版 を使いました_

### Flutter/Dart バージョン
- Flutter stable 3.27.3  
  - Channel stable, 3.27.3, on macOS 15.1.1 24B91  
    darwin-x64, locale ja-JP を使いました。
- Dart stable 3.6.1
  - Dart SDK version: 3.6.1 (stable)  
  (Tue Jan 7 09:50:00 2025 -0800) on "macos_x64" を使いました。

### fvm
このプロジェクトでは、Flutter SDK バージョンを統一するため `fvm` を利用しています。  
- fvm 3.2.1  
　https://pub.dev/packages/fvm

プロジェクトリポジトリには、SDK 3.27.3 を指定した `.fvmrc` が配置されているので、
プロジェクトのルートディレクトリで、`fvm use`を実行すれば SDK がインストールされ、
fvm コマンドで Flutter SDK 3.27.3 が利用できるようになります。

fvm をインストールされていない方は、下記のツールのインストールを実行しておいてください。  
- fvm ツールのインストールコマンド（Linux/macOS）  
```bash
curl -fsSL https://fvm.app/install.sh | bash
```

### Makefile
このプロジェクトでは、アプリの実行やコード生成をコンソールで行えるよう `Makefile`を利用しています。  
初めにプロジェクトのルートで `make setup`を実行して、コード生成など開発環境の初期設定を行ってください。  

また `make run`でデバッグ版アプリのビルドと実行ができるようになっています。  

この他にもコマンドがありますが、 flutter コマンドを fvm を介して実行させているだけなので、  
プロジェクトのルートにある `Makefile`の中を見ていただければ、
どんなコマンドで何ができるのかすぐに理解できると思います。

`make`コマンドは、macOS であれば標準で組み込まれているのでインストールする必要はありません。

### Android Studio 設定
プロジェクトへの fvm 設定が終わり、プロジェクトで使う Flutter/Dart バージョンが定まったら、    
Android Studio の Flutter/Dart 関連の設定を行います。  

1. Android SDK 設定（利用する Android SDK を指定します）  
  Settings > Languages & Frameworks > Android SDK > Android SDK location:  
  （Android SDK インストール先のパスを指定）例 ⇒ /Users/rie/android/sdk  

2. Dart SDK 設定  
  Settings > Languages & Frameworks > Dart > Dart SDK path:（Dart SDK インストール先）  
  ⇒ プロジェクトの .fvm/flutter_sdk/bin/cache/dart-sdk① になります。  
  Android Studio は絶対パス指定を要求するので具体的な①パスは、以下の ①のようにになることと、  
  設定後はシンボリックリンクの実態先② に変わることに注意してください。  
  - ①/Users/rie/yumemi/code_check/search_repositories_on_github/.fvm/flutter_sdk/bin/cache/dart-sdk  
  - ②/Users/rie/fvm/versions/3.27.3/bin/cache/dart-sdk  

3. Flutter SDK 設定  
  Settings > Languages & Frameworks > Flutter > SDK (current project only) >  
  Flutter SDK path: （Flutter SDK インストール先）  
  ⇒ プロジェクトの .fvm/flutter_sdk/bin/cache/dart-sdk① になります。  
  Android Studio は絶対パス指定を要求するので具体的な①パスは、以下の ①のようにになることと、  
  設定後はシンボリックリンクの実態先② に変わることに注意してください。  
  - ①/Users/rie/yumemi/code_check/search_repositories_on_github/.fvm/flutter_sdk  
  - ②/Users/rie/fvm/versions/3.27.3  

4. Dart フォーマット設定  
  フォーマット桁数を Flutter lint 想定に合わせるため 80桁に指定してください。  
  - Settings > Editor > Code Style > Dart > Editor > Line length [80]  
    （dart format に合わせたフォーマット桁数）

5. Flutter フォーマット設定  
  ファイルセーブごとにインポートの修正とフォーマットを適用するため以下の設定を行ってください。  
  - Settings > Languages & Frameworks > Flutter > Editor > [v] Format code on save  
  - Settings > Languages & Frameworks > Flutter > Editor > [v] Organize imports on save  

**補足 Format 関係の設定について**  
Flutter lint は、analysis_options.yaml に設定されたルールに従いますが、  
このルールは、dart format コマンドでフォーマットされたコードを想定しており、  
現在の dart format コマンドは、フォーマット桁数を 80 に限定しているため 80桁に指定します。  
将来の Dart 3.7 からは、analysis_options.yaml に format: セクションが追加され、  
フォーマット桁数の指定ができるようになります。

## プロジェクトリポジトリの設定について
このプロジェクトでは、開発履歴をわかりやすくするため Isseu駆動開発を行っています。  

このためデフォルトブランチは、develop に切り替えてあり、  
作業タスクは、Issue 番号を含めたブランチで開発してプルリクエストで develop ブランチにマージしています。

### Issues テンプレートの設定
GitHub テンプレートをベースに独自の Issue メニューを作りました。

### Pull Reauest テンプレートの設定
GitHub テンプレートをベースに独自の Pull Request テンプレートを作りました。

### dependabot 設定
このプロジェクトリポジトリには、dependabot を設定しています。

この設定により開発期間中に偶然 depandabot からのプルリクエストが入りましたので御確認ください。
- Bump go_router_builder from 2.7.2 to 2.7.3 #47  
  [https://github.com/cch-robo/search_repositories_on_github/pull/47](https://github.com/cch-robo/search_repositories_on_github/pull/47)

### GitHub Actions 設定
最低限のタスクとして、プルリクエストでの lintチェックやテスト実行を追加しました。  
以下のプルリクエストを御参照ください。

- GitHub Actons pull request チェックを有効にします。 [https://github.com/cch-robo/search_repositories_on_github/pull/82](https://github.com/cch-robo/search_repositories_on_github/pull/82)  
  [https://github.com/cch-robo/search_repositories_on_github/pull/80](https://github.com/cch-robo/search_repositories_on_github/pull/80) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/81](https://github.com/cch-robo/search_repositories_on_github/pull/81) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/82](https://github.com/cch-robo/search_repositories_on_github/pull/82)


## アプリの特徴について

### 国際化対応
日本語 ja と英語 en ロケールに対応するようにしています。  
以下のプルリクエストを御参照ください。

- （国際化対応） ja/en 国際化メッセージに対応 #24  
  [https://github.com/cch-robo/search_repositories_on_github/pull/24](https://github.com/cch-robo/search_repositories_on_github/pull/24)

- 国際化対応の残タスクを実装（リソース作成、ユースケース層対応） #52  
  [https://github.com/cch-robo/search_repositories_on_github/pull/52](https://github.com/cch-robo/search_repositories_on_github/pull/52)

### Dark Theme 対応
MaterialApp プロパティの theme /darkTheme 用の Theme を設定し、  
プラットフォームシステムでの Light / Dark モード切り替えに視覚的に対応しました。  

以下のプルリクエストを御参照ください。

- light/dark Theme に対応 #21  
  [https://github.com/cch-robo/search_repositories_on_github/pull/21](https://github.com/cch-robo/search_repositories_on_github/pull/21)


### Lint 制約強化
このプロジェクトでは、FlutterKaigi 2024 公式アプリの `analysis_options.yaml`をベースに、独自のルールを適用しています。  
以下のプルリクエストを御参照ください。

- 型省略させないルール方針に修正 #27  
  [https://github.com/cch-robo/search_repositories_on_github/pull/27](https://github.com/cch-robo/search_repositories_on_github/pull/27)

- lintチェックから生成コードファイルを除外するよう設定 #35  
  [https://github.com/cch-robo/search_repositories_on_github/pull/35](https://github.com/cch-robo/search_repositories_on_github/pull/35)


### 宣言型画面遷移対応
画面遷移に go_router の Type-safe Route を利用しています。  
以下のプルリクエストを御参照ください。

- 画面遷移を go_route 対応に改訂 #33  
  [https://github.com/cch-robo/search_repositories_on_github/pull/33](https://github.com/cch-robo/search_repositories_on_github/pull/33)


### アプリケーションレベルのエラーハンドリング対応
アプリレベル・エラーハンドラでは、  
アプリ内で見逃したか対処できなかったエラーが来ても、アプリをクラッシュさせずに、  
クローズできないエラー通知ダイアログを表示して、ユーザにアプリ終了を依頼します。

- 以下のエラーをトラップしてエラーダイアログを表示します。  
  - Flutter アプリ内からのエラー
  - Platform 内からのエラー  
  - 非同期処理内でのエラー  
  - アプリ起動前の処理でのエラー  

- また各エラーハンドラのオプションハンドラを指定できるようにして、  
  Firebase Crashlytics などへの対応もできるようにしています。

以下のプルリクエストを御参照ください。  

- アプリケーションレベルのエラーハンドリング対応を追加 #28  
  [https://github.com/cch-robo/search_repositories_on_github/pull/28](https://github.com/cch-robo/search_repositories_on_github/pull/28)


### ユースケースレベルのエラーダイアログ対応
アプリケーションレベルでなく、クエリ指定なしで検索しようとしたときの警告ように、  
ユースケースレベルのエラーダイアログを表示するようにもしています。  


### ユニットテスト
test/ディレクトリ配下にユニットテストを追加しています。  
また `make unit-test`でユニットテストを実行できるようにもしています。  

アプリでは、検索ボタンの押下を契機に、  
リポジトリやREST API Service で検索APIが実行されることから、  
ネットワーク通信を使う REST API Service をモック実装と差替えられるようにして、  
Widget Teet からユースケースサービスによる検索実行が行えることをチェックしています。  

以下のプルリクエストを御参照ください。  

- 不要な無限スクロールの NextPage 実行を抑止＋ユニットテストを追加 #55  
  [https://github.com/cch-robo/search_repositories_on_github/pull/55](https://github.com/cch-robo/search_repositories_on_github/pull/55)


## アプリの設計について

### レイヤ構成による依存関係の分離
アプリを Applicationレイヤを最上流とする、レイヤ構成で依存関係の上下を区別しています。  
ですのでユーザサイド視点では、プレゼン層が最上位となる以下の構成として見えます。  
- Presentation層（画面表示や UIを扱うレイヤ）
- Use Case 層（ユーザ都合のロジックやデータを扱うレイヤ）
- Domain 層（純粋なデータやロジックを扱うレイヤ）
- Applicaion 層（アプリ都合のレイヤ）
- Foundation 層（普遍知を扱うレイヤ）

_プロジェクト内のディレクトリ名は、上記の概念を反映しています。_  

- ドメイン知識がプレゼン層に漏れ出さないようにする防波堤としての Use Case レイヤ。  
今回のプロジェクトの要件は、GitHub search repositoriy API に端を発しています。  
このためアプリは、将来の GitHub API 仕様の変更による影響を受けます。  
　  
将来のバグ要因を作り込まないようにするには、  
GitHub API の都合は、Domain層で **ドメイン知識** として管理し、  
Use Case層は、ドメイン知識の詳細が プレゼン層に漏出しないようにするため、  
ユーザー入出力に必要なデータのみを Presentation層に渡し、詳細を隠蔽する設計が必要です。

  - _ドメイン知識がプレゼン層に漏出しないよう、[デメテルの法則](https://ja.wikipedia.org/wiki/%E3%83%87%E3%83%A1%E3%83%86%E3%83%AB%E3%81%AE%E6%B3%95%E5%89%87) だけでなく、  
  コンテキスト境界を越えさせないように Use Case層に Domain層をラップさせて Presentation層と連携させています。_  
  【参考】[Flutter テスト講座 - テスト設計できるようになろう](https://drive.google.com/file/d/1OznsKYxa_VSkrAwuH2cqpf1ZHxBNsLEg/view?usp=drive_link)

  - _今回のプロジェクトでは、エラー表示について DomainException 詳細を隠蔽することと、  
  メッセージの国際化対応のため context が必要なことから、エラー表示の一部を Use Case層に移譲しています。_

  - _クエリパラメータ・バリデーションは、 ドメイン知識詳細が Presentation層に漏れ出さないよう Domain層で行い、  
  結果を　DomainException として Use Case 層に渡しています。_

- またこのプロジェクトは、マルチモジュール構成でないため依存関係の分離には制限があります。  
このため依存関係の分離の手段として、レイヤごとの公開クラスを定義するファイルを設けました。  
　  
以下のプルリクエストを御参照ください。  

  - インポート構成を改良 #48  
  [https://github.com/cch-robo/search_repositories_on_github/pull/48](https://github.com/cch-robo/search_repositories_on_github/pull/48)


## その他の対応
- エラーダイアログ表示中は、検索サービスを停止しています。  
  _エラーダイアログが複数件表示されません。_
  [https://github.com/cch-robo/search_repositories_on_github/pull/64](https://github.com/cch-robo/search_repositories_on_github/pull/64) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/76](https://github.com/cch-robo/search_repositories_on_github/pull/76) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/79](https://github.com/cch-robo/search_repositories_on_github/pull/79)

- ResultsPageの AppBarを固定表示にしています。  
  _AppBarの固定表示により、SearchPageに戻りやすくなっています。_
  [https://github.com/cch-robo/search_repositories_on_github/pull/66](https://github.com/cch-robo/search_repositories_on_github/pull/66)

- SearchPageは、縦方向画面のみに制限してます。  
  _狭小画面デバイスで、検索条件と検索ボタンとソフトキーボードの表示領域がない場合に対応しています。_
  [https://github.com/cch-robo/search_repositories_on_github/pull/68](https://github.com/cch-robo/search_repositories_on_github/pull/68)

- Android プラットフォーム固有問題に対処しています。  
  _Android では、追加検索時にスクロール位置ロストするため下スクロール操作が必要であった。_  
  _iOS では不要な下スクロール操作に対処するためスクロール位置を保管して、補正するようにしています。_
  [https://github.com/cch-robo/search_repositories_on_github/pull/73](https://github.com/cch-robo/search_repositories_on_github/pull/73) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/90](https://github.com/cch-robo/search_repositories_on_github/pull/90)

- 実態調査から獲得したドメイン知識をクエリパラメータのバリデーションに反映しています。  
  _クエリパラメータ最大長を越えた検索を行うと 422 エラーが発生するので、_  
  _ユーザーが検索サービス最大長を超えた検索条件パラメータを入力していれば警告を表示します。_
  [https://github.com/cch-robo/search_repositories_on_github/pull/86](https://github.com/cch-robo/search_repositories_on_github/pull/86) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/88](https://github.com/cch-robo/search_repositories_on_github/pull/88) 
  [https://github.com/cch-robo/search_repositories_on_github/pull/93](https://github.com/cch-robo/search_repositories_on_github/pull/93)

- GitHub search repository API から取得したリポジトリモデルの freezed 対応などのリファクタリングを行っています。
  [https://github.com/cch-robo/search_repositories_on_github/pull/97](https://github.com/cch-robo/search_repositories_on_github/pull/97)

- 要件外の対応や将来的なチャレンジなど、今回扱わなかったものについてはこちらを参照ください。
[https://github.com/cch-robo/search_repositories_on_github/pull/101](https://github.com/cch-robo/search_repositories_on_github/pull/101)


## アプリ画像
![Demo_SearchPage](docs/images/Demo_SearchPage.png)
![Demo_ResultPage](docs/images/Demo_ResultPage.png)
![Demo_DetailPage](docs/images/Demo_DetailPage.png)

