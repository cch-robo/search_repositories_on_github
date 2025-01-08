import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appDescription =>
      'The Search Repo app uses the GitHub API to search repositories with arbitrary queries.';

  @override
  String get appTitle => 'Search Repo';

  @override
  String get errorDialogTitle => 'Error';

  @override
  String get errorDialogUnexpectedErrorMessage =>
      'An unexpected error has occurred.\n\nWe are unable to fix the problem so please close the app.';

  @override
  String get errorButtonOk => 'OK';

  @override
  String get errorButtonCancel => 'Cancel';
}
