import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ja'),
    Locale('en')
  ];

  /// No description provided for @appDescription.
  ///
  /// In ja, this message translates to:
  /// **'Search Repo は、GitHub API を使って任意クエリでリポジトリ検索するアプリです。'**
  String get appDescription;

  /// No description provided for @appTitle.
  ///
  /// In ja, this message translates to:
  /// **'Search Repo'**
  String get appTitle;

  /// No description provided for @errorDialogTitle.
  ///
  /// In ja, this message translates to:
  /// **'Error'**
  String get errorDialogTitle;

  /// No description provided for @errorDialogUnexpectedErrorMessage.
  ///
  /// In ja, this message translates to:
  /// **'想定外のエラーが発生しました。\n\n問題に対応できないため、アプリを終了してください。'**
  String get errorDialogUnexpectedErrorMessage;

  /// No description provided for @errorButtonOk.
  ///
  /// In ja, this message translates to:
  /// **'OK'**
  String get errorButtonOk;

  /// No description provided for @errorButtonCancel.
  ///
  /// In ja, this message translates to:
  /// **'Cancel'**
  String get errorButtonCancel;

  /// No description provided for @errorMessageEmptyQuery.
  ///
  /// In ja, this message translates to:
  /// **'検索クエリがありません。'**
  String get errorMessageEmptyQuery;

  /// No description provided for @errorMessageTooLongQuery.
  ///
  /// In ja, this message translates to:
  /// **'検索クエリは、256文字までです。'**
  String get errorMessageTooLongQuery;

  /// No description provided for @errorMessageDioException.
  ///
  /// In ja, this message translates to:
  /// **'ネットワーク通信に問題がでました。'**
  String get errorMessageDioException;

  /// No description provided for @errorMessageUnknownException.
  ///
  /// In ja, this message translates to:
  /// **'想定外の問題が発生しました。'**
  String get errorMessageUnknownException;

  /// No description provided for @errorMessageApiProblem.
  ///
  /// In ja, this message translates to:
  /// **'サーバーとの間で問題が発生しました。'**
  String get errorMessageApiProblem;

  /// No description provided for @searchPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'GitHub リポジトリ検索'**
  String get searchPageTitle;

  /// No description provided for @searchRequest.
  ///
  /// In ja, this message translates to:
  /// **'検索条件を指定してください。'**
  String get searchRequest;

  /// No description provided for @searchConditionReadme.
  ///
  /// In ja, this message translates to:
  /// **'README 条件'**
  String get searchConditionReadme;

  /// No description provided for @searchConditionReadmeRequest.
  ///
  /// In ja, this message translates to:
  /// **'README に含まれるテキストを入力してください'**
  String get searchConditionReadmeRequest;

  /// No description provided for @searchConditionDescription.
  ///
  /// In ja, this message translates to:
  /// **'description 条件'**
  String get searchConditionDescription;

  /// No description provided for @searchConditionDescriptionRequest.
  ///
  /// In ja, this message translates to:
  /// **'description に含まれるテキストを入力してください'**
  String get searchConditionDescriptionRequest;

  /// No description provided for @searchConditionRepoName.
  ///
  /// In ja, this message translates to:
  /// **'リポジトリ名 条件'**
  String get searchConditionRepoName;

  /// No description provided for @searchConditionRepoNamRequest.
  ///
  /// In ja, this message translates to:
  /// **'リポジトリ名 に含まれるテキストを入力してください'**
  String get searchConditionRepoNamRequest;

  /// No description provided for @searchConditionTopics.
  ///
  /// In ja, this message translates to:
  /// **'topics 条件'**
  String get searchConditionTopics;

  /// No description provided for @searchConditionTopicsRequest.
  ///
  /// In ja, this message translates to:
  /// **'topics のラベルを入力してください'**
  String get searchConditionTopicsRequest;

  /// No description provided for @searchButton.
  ///
  /// In ja, this message translates to:
  /// **'検索'**
  String get searchButton;

  /// No description provided for @detailPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'GitHub リポジトリ検索'**
  String get detailPageTitle;

  /// No description provided for @detailItemRepoName.
  ///
  /// In ja, this message translates to:
  /// **'リポジトリ名'**
  String get detailItemRepoName;

  /// No description provided for @detailItemOwnerIcon.
  ///
  /// In ja, this message translates to:
  /// **'オーナーアイコン'**
  String get detailItemOwnerIcon;

  /// No description provided for @detailItemLanguage.
  ///
  /// In ja, this message translates to:
  /// **'プロジェクト言語'**
  String get detailItemLanguage;

  /// No description provided for @detailItemStarCount.
  ///
  /// In ja, this message translates to:
  /// **'Star 数'**
  String get detailItemStarCount;

  /// No description provided for @detailItemWatcherCount.
  ///
  /// In ja, this message translates to:
  /// **'Watcher 数'**
  String get detailItemWatcherCount;

  /// No description provided for @detailItemIssueCount.
  ///
  /// In ja, this message translates to:
  /// **'Issue 数'**
  String get detailItemIssueCount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
