import 'dart:async';

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

  /// 検索中フラグ
  bool get isSearching => state.condition == Condition.searching;

  /// 検索エラーフラグ
  bool get isError => state.condition == Condition.error;

  /// 検索完了フラグ
  bool get isComplete => state.condition == Condition.complete;

  /// index 番号指定のリポジトリ情報を取得する。
  RepoModel? getRepoInfo(int index) {
    final ({RepoModel? repo, int left}) res =
        searchRepoService.getRepoInfo(index);
    // データ未取得でかつ、取得可能であれば次ページデータを取得する。
    if (res.repo == null && res.left > 0) {
      // 次ページの検索を実行
      unawaited(searchNext());
    }
    return res.repo;
  }

  /// 指定クエリで次ページを検索
  Future<void> searchNext() async {
    // 検索コンディションを 検索中に更新
    state = state.copyWith(condition: Condition.searching);

    final SearchInfo? info = await searchRepoService.addNextRepositories();
    if (info != null) {
      // 検索コンディションを成功に更新
      state = state.copyWith(condition: Condition.complete);

      debugLog('search  totalRepositories=${info.totalCount}');
      for (final RepoModel repo in info.repositories) {
        debugLog('name=${repo.name}');
      }
    } else {
      // 検索コンディションをエラーに更新
      state = state.copyWith(condition: Condition.error);
    }
  }
}
