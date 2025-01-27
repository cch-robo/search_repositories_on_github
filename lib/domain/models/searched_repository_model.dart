import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/search_repository_owner_model.dart';

part 'searched_repository_model.freezed.dart';
part 'searched_repository_model.g.dart';

/// リポジトリモデル
///
/// 検索されたリポジトリ情報を表すモデルです。
@freezed
class RepoModel with _$RepoModel {
  const factory RepoModel({
    required int? id,
    required String? name,
    @JsonKey(name: 'full_name') required String? fullName,
    @JsonKey(name: 'html_url') required String? htmlUrl,
    required String? description,
    required OwnerModel? owner,
    required String? language,
    @JsonKey(name: 'stargazers_count') required int? startsCount,
    @JsonKey(name: 'watchers_count') required int? watchersCount,
    @JsonKey(name: 'forks_count') required int? forksCount,
    @JsonKey(name: 'open_issues_count') required int? issuesCount,
    @JsonKey(name: 'private') required bool? isPrivate,
    @JsonKey(name: 'archived') required bool? isArchived,
    @JsonKey(name: 'disabled') required bool? isDisabled,
  }) = _RepoModel;

  factory RepoModel.fromJson(Map<String, Object?> json) =>
      _$RepoModelFromJson(json);
}
