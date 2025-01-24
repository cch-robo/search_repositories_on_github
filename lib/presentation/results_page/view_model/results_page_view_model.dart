import 'dart:async';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

import '../../../domain/publications.dart';
import '../../shared_state_on_pages/state/search_condition_state.dart';
import '../../ui_components/error_dialog.dart';

part 'results_page_view_model.g.dart';

/// （riverpod での notifier） ResultsPage ViewModel
@riverpod
class ResultsPageViewModel extends _$ResultsPageViewModel {
  ResultsPageViewModel();

  @override
  SearchConditionState build() {
    return const SearchConditionState(condition: Condition.before);
  }

  final AsyncCache<void> cacheStrategy = AsyncCache<void>.ephemeral();

  /// 検索中フラグ
  bool get isSearching => state.condition == Condition.searching;

  /// 検索エラーフラグ
  bool get isError => state.condition == Condition.error;

  /// 検索完了フラグ
  bool get isComplete => state.condition == Condition.complete;

  /// 検索エラーフラグ
  bool get hasError => isError;

  /// Android スクロール位置補正用（アイテム高）
  double _itemHeight = 0;

  /// Android スクロール位置補正用（スクロール位置）
  double _maxOffset = 0;

  /// index 番号指定のリポジトリ情報を取得する。
  RepoModel? getRepoInfo(
    BuildContext context,
    int index,
    ScrollController scrollController,
  ) {
    final ({RepoModel? repo, int left}) res =
        searchRepoService.getRepoInfo(index);

    final double offset =
        res.repo != null && scrollController.position.hasPixels
            ? scrollController.position.pixels
            : 0;

    _maxOffset = offset == 0 ? _maxOffset : offset;
    _itemHeight = offset == 0 ? (_maxOffset / index - 1) : (_maxOffset / index);

    // データ未取得でかつ、取得可能であれば次ページデータを取得する。
    if (res.repo == null && res.left > 0) {
      // 次ページの検索を実行
      Future<void>.delayed(const Duration(milliseconds: 500), () {
        unawaited(
          cacheStrategy.fetch(
            () async {
              await searchNext(context);
              if (Platform.isAndroid) {
                // Android は、データロード後にスクロール位置をロストするため補正を入れる
                scrollController.jumpTo(_maxOffset + _itemHeight * 5);
              }

              if (isError) {
                // 検索キューをフラッシュする。
                cacheStrategy.invalidate();
                debugLog('getRepoInfo  error occur.');

                // ユーザへのエラー確認チェック要請
                Future<void>.delayed(const Duration(milliseconds: 500), () {
                  unawaited(
                    cacheStrategy.fetch(
                      () async {
                        await errorConfirmed(context);
                      },
                    ),
                  );
                });
              }
            },
          ),
        );
      });
    }
    return res.repo;
  }

  /// 指定クエリで次ページを検索
  Future<void> searchNext(BuildContext context) async {
    // 検索コンディションを 検索中に更新
    state = state.copyWith(condition: Condition.searching);
    debugLog('searchNext  searching');

    // 次ページ検索実行
    final SearchInfo? info =
        await searchRepoService.addNextRepositories(context: context);
    if (info != null) {
      // 検索コンディションを成功に更新
      state = state.copyWith(condition: Condition.complete);
      debugLog('searchNext  complete - totalCount=${info.totalCount}, '
          'loadedCount=${info.repositories.length}\n');
    } else {
      // 検索コンディションをエラーに更新
      state = state.copyWith(condition: Condition.error);
      debugLog('searchNext  error\n');
    }
  }

  Future<void> errorConfirmed(BuildContext context) async {
    debugLog('errorConfirmed - condition=${state.condition.name}');

    if (hasError) {
      final ErrorInfo errorInfo = searchRepoService.errorInfo!;
      final PresentationErrorDialog errorDialog = PresentationErrorDialog();
      await errorDialog.showErrorAlertDialog(
        context: context,
        title: errorInfo.title,
        message: errorInfo.message,
      );

      // ユーザがエラーを確認したので検索コンディションを更新する。
      state = state.copyWith(condition: Condition.before);
      debugLog('errorConfirmed  before\n');
    }
  }
}
