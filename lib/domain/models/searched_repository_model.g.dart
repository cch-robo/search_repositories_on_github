// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepoModelImpl _$$RepoModelImplFromJson(Map<String, dynamic> json) =>
    _$RepoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      htmlUrl: json['html_url'] as String?,
      description: json['description'] as String?,
      owner: json['owner'] == null
          ? null
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      language: json['language'] as String?,
      startsCount: (json['stargazers_count'] as num?)?.toInt(),
      watchersCount: (json['watchers_count'] as num?)?.toInt(),
      forksCount: (json['forks_count'] as num?)?.toInt(),
      issuesCount: (json['open_issues_count'] as num?)?.toInt(),
      isPrivate: json['private'] as bool?,
      isArchived: json['archived'] as bool?,
      isDisabled: json['disabled'] as bool?,
    );

Map<String, dynamic> _$$RepoModelImplToJson(_$RepoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'owner': instance.owner,
      'language': instance.language,
      'stargazers_count': instance.startsCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.issuesCount,
      'private': instance.isPrivate,
      'archived': instance.isArchived,
      'disabled': instance.isDisabled,
    };
