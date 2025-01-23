import 'dart:async';

import 'package:flutter/material.dart';
import 'package:search_repositories_on_github/application/publications.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../error/use_case_error_dialog.dart';

/// ユースケース・レイヤレベルの検索情報を取得します。
class SearchRepoService {
  SearchRepoService(this._repository);
  final SearchedRepoRepository _repository;
  final UseCaseErrorHDialog _errorDialog = UseCaseErrorHDialog();

  SearchInfo? _searchInfo;

  /// ユースケースレベルの検索情報
  SearchInfo? get searchInfo => _searchInfo;

  /// index 番号で示されたリポジトリ情報を取得します。
  ///
  /// 返却値
  /// - repo: リポジトリ情報（検索エラーや有効な index でない場合は nullが返る）
  /// - left: 未取得件数 （検索エラーや有効な index でない場合は 0が返る）
  ({int left, RepoModel? repo}) getRepoInfo(int index) {
    if (_searchInfo == null) {
      return (repo: null, left: 0);
    }

    final SearchInfo info = _searchInfo!;
    final int loaded = info.repositories.length;
    final int left = info.totalCount - loaded;

    if (index < loaded) {
      return (repo: info.repositories[index], left: left);
    }
    if (index < info.totalCount) {
      return (repo: null, left: left);
    }
    return (repo: null, left: 0);
  }

  /// クエリで検索を開始する。
  ///
  /// この API が利用されるユースケースとしては、
  /// 検索条件を入力して検索ボタンを押下したときを想定しています。
  Future<SearchInfo?> searchRepoByInQuery({
    required BuildContext context,
    required String readme,
    required String description,
    required String repoName,
    required String topics,
  }) async {
    // 検索情報を初期化
    _searchInfo = null;

    final List<QueryItem> items = <QueryItem>[];
    _addQueryItem(items, InFilter.readme, readme);
    _addQueryItem(items, InFilter.description, description);
    _addQueryItem(items, InFilter.name, repoName);
    _addQueryItem(items, InFilter.topics, topics);

    // クエリ生成
    final Query query = Query(items);
    try {
      // 何も入力されていなかった場合
      if (items.isEmpty) {
        throw DomainException('', type: DomainExceptionType.emptyQuery);
      }

      // リポジトリに問い合わせ
      final SearchRepoInfoModel info =
          await _repository.searchRepositories(query: query);

      // 必要な情報のみを取得して返却
      return _searchInfo = SearchInfo(
        query: info.query,
        totalCount: info.totalCount,
        repositories: info.repositories,
      );
    } on DomainException catch (exp) {
      debugLog(
        'SearchRepoService - searchRepoByInQuery catch Exception.',
        cause: exp,
      );
      if (context.mounted) {
        final String message = switch (exp.type) {
          DomainExceptionType.emptyQuery =>
            l10n(context).errorMessageEmptyQuery,
          DomainExceptionType.tooLongQuery =>
            l10n(context).errorMessageTooLongQuery,
          DomainExceptionType.dioException =>
            l10n(context).errorMessageDioException,
          DomainExceptionType.unknownException =>
            l10n(context).errorMessageUnknownException,
          _ => l10n(context).errorMessageApiProblem,
        };
        unawaited(
          _errorDialog.showErrorAlertDialog(
            context: context,
            title: l10n(context).errorDialogTitle,
            message: message,
          ),
        );
      }
    }
    return null;
  }

  /// クエリ検索を続行する。
  ///
  /// この API が利用されるユースケースとしては、
  /// 検索結果一覧のスクロールで下端に達したときを想定しています。
  ///
  /// _返却された検索情報には、今まで取得したページ分の情報も含まれています。_
  Future<SearchInfo?> addNextRepositories({
    required BuildContext context,
  }) async {
    // 次ページ検索条件チェック
    if (searchInfo == null ||
        searchInfo!.totalCount == searchInfo!.repositories.length) {
      return searchInfo;
    }

    try {
      // リポジトリに問い合わせ
      final SearchRepoInfoModel info = await _repository.addNextRepositories();

      // 必要な情報のみを取得して返却
      return _searchInfo = SearchInfo(
        query: info.query,
        totalCount: info.totalCount,
        repositories: info.repositories,
      );
    } on DomainException catch (exp) {
      debugLog(
        'SearchRepoService - addNextRepositories catch Exception.',
        cause: exp,
      );

      if (context.mounted) {
        final String message = switch (exp.type) {
          DomainExceptionType.emptyQuery =>
            l10n(context).errorMessageEmptyQuery,
          DomainExceptionType.tooLongQuery =>
            l10n(context).errorMessageTooLongQuery,
          DomainExceptionType.overRateLimits =>
            l10n(context).errorMessageOverRateLimits,
          DomainExceptionType.dioException =>
            l10n(context).errorMessageDioException,
          DomainExceptionType.unknownException =>
            l10n(context).errorMessageUnknownException,
          _ => l10n(context).errorMessageApiProblem,
        };
        await _errorDialog.showErrorAlertDialog(
          context: context,
          title: l10n(context).errorDialogTitle,
          message: message,
        );
      }
    }
    return null;
  }

  void _addQueryItem(List<QueryItem> items, InFilter filter, String keyWord) {
    if (keyWord.trim().isNotEmpty) {
      items.add(filter.toQueryItem(keyWord.trim()));
    }
  }
}

/// ユースケースレベルの検索情報モデル
class SearchInfo {
  SearchInfo({
    required this.query,
    required this.totalCount,
    required this.repositories,
  });

  /// 検索したクエリ情報
  final String query;

  /// 検索条件の総リポジトリ数
  final int totalCount;

  /// 取得済みの検索リポジトリのリスト（可変）
  final List<RepoModel> repositories;
}
