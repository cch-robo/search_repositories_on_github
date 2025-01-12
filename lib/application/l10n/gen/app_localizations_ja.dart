import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appDescription =>
      'Search Repo は、GitHub API を使って任意クエリでリポジトリ検索するアプリです。';

  @override
  String get appTitle => 'Search Repo';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get errorDialogUnexpectedErrorMessage =>
      '想定外のエラーが発生しました。\n\n問題に対応できないため、アプリを終了してください。';

  @override
  String get errorButtonOk => 'OK';

  @override
  String get errorButtonCancel => 'Cancel';

  @override
  String get errorMessageEmptyQuery => '検索クエリがありません。';

  @override
  String get errorMessageTooLongQuery => '検索クエリは、256文字までです。';

  @override
  String get errorMessageDioException => 'ネットワーク通信に問題がでました。';

  @override
  String get errorMessageUnknownException => '想定外の問題が発生しました。';

  @override
  String get errorMessageApiProblem => 'サーバーとの間で問題が発生しました。';

  @override
  String get searchPageTitle => 'Search Page';

  @override
  String get searchPageSubTitle => 'GitHub リポジトリ検索';

  @override
  String get searchRequest => '検索条件を指定してください。';

  @override
  String get searchConditionReadme => 'README 条件';

  @override
  String get searchConditionReadmeRequest => 'README に含まれるテキストを入力してください';

  @override
  String get searchConditionDescription => 'description 条件';

  @override
  String get searchConditionDescriptionRequest =>
      'description に含まれるテキストを入力してください';

  @override
  String get searchConditionRepoName => 'リポジトリ名 条件';

  @override
  String get searchConditionRepoNamRequest => 'リポジトリ名 に含まれるテキストを入力してください';

  @override
  String get searchConditionTopics => 'topics 条件';

  @override
  String get searchConditionTopicsRequest => 'topics のラベルを入力してください';

  @override
  String get searchButton => '検索';

  @override
  String get resultsPageTitle => 'Results Page';

  @override
  String get resultsPageSubTitle => 'GitHub リポジトリ検索';

  @override
  String get detailPageTitle => 'Detail Page';

  @override
  String get detailPageSubTitle => 'GitHub リポジトリ検索';

  @override
  String get detailItemRepoName => 'リポジトリ名';

  @override
  String get detailItemOwnerIcon => 'オーナーアイコン';

  @override
  String get detailItemLanguage => 'プロジェクト言語';

  @override
  String get detailItemStarCount => 'Star 数';

  @override
  String get detailItemForkCount => 'Fork 数';

  @override
  String get detailItemWatcherCount => 'Watcher 数';

  @override
  String get detailItemIssueCount => 'Issue 数';
}
