import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

import '../../../domain/publications.dart';
import '../../shared_state_on_pages/state/search_condition_state.dart';

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

  /// index 番号指定のリポジトリ情報を取得する。
  RepoModel? getRepoInfo(BuildContext context, int index) {
    final ({RepoModel? repo, int left}) res =
        searchRepoService.getRepoInfo(index);
    // データ未取得でかつ、取得可能であれば次ページデータを取得する。
    if (res.repo == null && res.left > 0) {
      // 次ページの検索を実行
      Future<void>.delayed(const Duration(milliseconds: 500), () {
        // ignore: discarded_futures
        cacheStrategy.fetch(() => searchNext(context));
      });
    }
    return res.repo;
  }

  /// 指定クエリで次ページを検索
  Future<void> searchNext(BuildContext context) async {
    // 検索コンディションを 検索中に更新
    state = state.copyWith(condition: Condition.searching);

    final SearchInfo? info =
        await searchRepoService.addNextRepositories(context: context);
    if (info != null) {
      // 検索コンディションを成功に更新
      state = state.copyWith(condition: Condition.complete);

      debugLog('searchNext  totalCount=${info.totalCount}, '
          'loadedCount=${info.repositories.length}');
    } else {
      // 検索コンディションをエラーに更新
      state = state.copyWith(condition: Condition.error);
    }
  }
}
