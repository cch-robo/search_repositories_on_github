import 'package:flutter/widgets.dart';
import 'package:search_repositories_on_github/application/l10n/gen/app_localizations.dart';

/// l10n 国際化メッセージ・リソースプロバイダ・サービス
///
/// - [AppLocalizations] を返すサービスです。<br/>
///   [AppLocalizations.of] を短文表記できるようにしたラッパーです。
///
/// ```dart
/// // 使用例
/// final String message = l10n(context).helloWorld;
/// ```
AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context);
