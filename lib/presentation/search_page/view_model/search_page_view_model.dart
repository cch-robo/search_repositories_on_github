import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/domain/models/searched_repository_model.dart';
import 'package:search_repositories_on_github/foundation/debug/debug_logger.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

import '../../shared_state_on_pages/state/search_condition_state.dart';

part 'search_page_view_model.g.dart';

/// （riverpod での notifier） SearchPage ViewModel
@riverpod
class SearchPageViewModel extends _$SearchPageViewModel {
  SearchPageViewModel();

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

  /// 指定クエリでリポジトリを検索
  Future<void> search({
    required String readme,
    required String description,
    required String repoName,
    required String topics,
  }) async {
    // 検索コンディションを 検索中に更新
    state = state.copyWith(condition: Condition.searching);

    final SearchInfo? info = await searchRepoService.searchRepoByInQuery(
      readme: readme,
      description: description,
      repoName: repoName,
      topics: topics,
    );
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
