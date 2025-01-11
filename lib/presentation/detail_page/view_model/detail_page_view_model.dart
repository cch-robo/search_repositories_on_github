import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/domain/publications.dart';
import 'package:search_repositories_on_github/use_case/publications.dart';

part 'detail_page_view_model.freezed.dart';
part 'detail_page_view_model.g.dart';

// 表示するリポジトリ情報の index を表すモデルです。
@freezed
class DetailPageModelState with _$DetailPageModelState {
  const factory DetailPageModelState({
    required int index,
  }) = _DetailPageModelState;
}

/// （riverpod での notifier） DetailPage ViewModel
@riverpod
class DetailPageViewModel extends _$DetailPageViewModel {
  DetailPageViewModel();

  @override
  DetailPageModelState build() {
    return const DetailPageModelState(index: 0);
  }

  /// 詳細表示するリポジトリ情報 index を通知
  void notifyShowDetail({
    required int index,
  }) {
    // DetailPage は画面更新を行わないので、
    // state を更新しても、再構築は発生しない。
    state = state.copyWith(index: index);
  }

  /// リポジトリ情報を取得する。
  RepoModel? getRepoInfo() {
    final ({RepoModel? repo, int left}) res =
        searchRepoService.getRepoInfo(state.index);
    return res.repo;
  }
}
