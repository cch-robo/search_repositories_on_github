import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

part 'detail_page_view_model.freezed.dart';
part 'detail_page_view_model.g.dart';

// 表示するリポジトリ情報を保持するモデルです。
@freezed
class DetailPageModelState with _$DetailPageModelState {
  const factory DetailPageModelState({
    required RepoModel? repo,
  }) = _DetailPageModelState;
}

/// （riverpod での notifier） DetailPage ViewModel
@riverpod
class DetailPageViewModel extends _$DetailPageViewModel {
  DetailPageViewModel();

  @override
  DetailPageModelState build() {
    return const DetailPageModelState(repo: null);
  }

  /// リポジトリ情報を取得する。
  RepoModel? getRepoInfo(int index) {
    final ({RepoModel? repo, int left}) res =
        searchRepoService.getRepoInfo(index);
    return res.repo;
  }
}
