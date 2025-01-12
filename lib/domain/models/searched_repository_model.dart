import 'package:flutter/foundation.dart';

/// リポジトリモデル
///
/// 検索されたリポジトリ情報を表すモデルです。
@immutable
class RepoModel {
  const RepoModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.ownerName,
    required this.ownerAvatarUrl,
    required this.language,
    required this.startsCount,
    required this.watchersCount,
    required this.forksCount,
    required this.issuesCount,
    required this.isPrivate,
    required this.isArchived,
    required this.isDisabled,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> owner = json['owner'] as Map<String, dynamic>;
    final String? ownerName = owner['login'] as String?;
    final String? ownerAvatarUrl = owner['avatar_url'] as String?;

    final int? repoId = json['id'] as int?;
    final String? repoName = json['name'] as String?;
    final String? repoFullName = json['full_name'] as String?;
    final String? repoHtmlUrl = json['html_url'] as String?;
    final String? repoDescription = json['description'] as String?;

    final String? repoLanguage = json['language'] as String?;
    final int? startsCount = json['stargazers_count'] as int?;
    final int? watchersCount = json['watchers_count'] as int?;
    final int? forksCount = json['forks_count'] as int?;
    final int? issuesCount = json['open_issues_count'] as int?;

    final bool? isPrivate = json['private'] as bool?;
    final bool? isArchived = json['archived'] as bool?;
    final bool? isDisabled = json['disabled'] as bool?;

    return RepoModel(
      id: repoId ?? 0,
      name: repoName ?? '',
      fullName: repoFullName ?? '',
      description: repoDescription ?? '',
      htmlUrl: repoHtmlUrl ?? '',
      ownerName: ownerName ?? '',
      ownerAvatarUrl: ownerAvatarUrl ?? '',
      language: repoLanguage ?? '',
      startsCount: startsCount ?? 0,
      watchersCount: watchersCount ?? 0,
      forksCount: forksCount ?? 0,
      issuesCount: issuesCount ?? 0,
      isPrivate: isPrivate,
      isArchived: isArchived,
      isDisabled: isDisabled,
    );
  }

  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  final String description;

  final String ownerName;
  final String ownerAvatarUrl;

  final String language;
  final int startsCount;
  final int watchersCount;
  final int forksCount;
  final int issuesCount;

  final bool? isPrivate;
  final bool? isArchived;
  final bool? isDisabled;
}
