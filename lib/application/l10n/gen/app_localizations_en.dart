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

  @override
  String get errorMessageEmptyQuery => 'There is no search query.';

  @override
  String get errorMessageTooLongQuery =>
      'Search queries cannot exceed 256 characters.';

  @override
  String get errorMessageDioException =>
      'A network communication problem occurred.';

  @override
  String get errorMessageUnknownException => 'An unexpected problem occurred.';

  @override
  String get errorMessageApiProblem => 'A problem occurred with the server.';

  @override
  String get searchPageTitle => 'GitHub repository search';

  @override
  String get searchRequest => 'Please specify search conditions.';

  @override
  String get searchConditionReadme => 'README condition';

  @override
  String get searchConditionReadmeRequest =>
      'Please enter text contained in README';

  @override
  String get searchConditionDescription => 'description condition';

  @override
  String get searchConditionDescriptionRequest =>
      'Please enter text contained in description';

  @override
  String get searchConditionRepoName => 'Repository name condition';

  @override
  String get searchConditionRepoNamRequest =>
      'Please enter text contained in repository name';

  @override
  String get searchConditionTopics => 'topics condition';

  @override
  String get searchConditionTopicsRequest => 'Enter topic label';

  @override
  String get searchButton => 'Search';

  @override
  String get detailPageTitle => 'GitHub repository search';

  @override
  String get detailItemRepoName => 'Repository name';

  @override
  String get detailItemOwnerIcon => 'Owner icon';

  @override
  String get detailItemLanguage => 'Project language';

  @override
  String get detailItemStarCount => 'Number of stars';

  @override
  String get detailItemForkCount => 'Number of forks';

  @override
  String get detailItemWatcherCount => 'Number of watchers';

  @override
  String get detailItemIssueCount => 'Number of issues';
}
