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
}
