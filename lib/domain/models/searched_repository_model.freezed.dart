// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searched_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepoModel _$RepoModelFromJson(Map<String, dynamic> json) {
  return _RepoModel.fromJson(json);
}

/// @nodoc
mixin _$RepoModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  OwnerModel? get owner => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int? get startsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchers_count')
  int? get watchersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int? get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_issues_count')
  int? get issuesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'private')
  bool? get isPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: 'archived')
  bool? get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'disabled')
  bool? get isDisabled => throw _privateConstructorUsedError;

  /// Serializes this RepoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoModelCopyWith<RepoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoModelCopyWith<$Res> {
  factory $RepoModelCopyWith(RepoModel value, $Res Function(RepoModel) then) =
      _$RepoModelCopyWithImpl<$Res, RepoModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'html_url') String? htmlUrl,
      String? description,
      OwnerModel? owner,
      String? language,
      @JsonKey(name: 'stargazers_count') int? startsCount,
      @JsonKey(name: 'watchers_count') int? watchersCount,
      @JsonKey(name: 'forks_count') int? forksCount,
      @JsonKey(name: 'open_issues_count') int? issuesCount,
      @JsonKey(name: 'private') bool? isPrivate,
      @JsonKey(name: 'archived') bool? isArchived,
      @JsonKey(name: 'disabled') bool? isDisabled});

  $OwnerModelCopyWith<$Res>? get owner;
}

/// @nodoc
class _$RepoModelCopyWithImpl<$Res, $Val extends RepoModel>
    implements $RepoModelCopyWith<$Res> {
  _$RepoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? fullName = freezed,
    Object? htmlUrl = freezed,
    Object? description = freezed,
    Object? owner = freezed,
    Object? language = freezed,
    Object? startsCount = freezed,
    Object? watchersCount = freezed,
    Object? forksCount = freezed,
    Object? issuesCount = freezed,
    Object? isPrivate = freezed,
    Object? isArchived = freezed,
    Object? isDisabled = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerModel?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      startsCount: freezed == startsCount
          ? _value.startsCount
          : startsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      watchersCount: freezed == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      forksCount: freezed == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      issuesCount: freezed == issuesCount
          ? _value.issuesCount
          : issuesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDisabled: freezed == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerModelCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerModelCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepoModelImplCopyWith<$Res>
    implements $RepoModelCopyWith<$Res> {
  factory _$$RepoModelImplCopyWith(
          _$RepoModelImpl value, $Res Function(_$RepoModelImpl) then) =
      __$$RepoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'html_url') String? htmlUrl,
      String? description,
      OwnerModel? owner,
      String? language,
      @JsonKey(name: 'stargazers_count') int? startsCount,
      @JsonKey(name: 'watchers_count') int? watchersCount,
      @JsonKey(name: 'forks_count') int? forksCount,
      @JsonKey(name: 'open_issues_count') int? issuesCount,
      @JsonKey(name: 'private') bool? isPrivate,
      @JsonKey(name: 'archived') bool? isArchived,
      @JsonKey(name: 'disabled') bool? isDisabled});

  @override
  $OwnerModelCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$RepoModelImplCopyWithImpl<$Res>
    extends _$RepoModelCopyWithImpl<$Res, _$RepoModelImpl>
    implements _$$RepoModelImplCopyWith<$Res> {
  __$$RepoModelImplCopyWithImpl(
      _$RepoModelImpl _value, $Res Function(_$RepoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? fullName = freezed,
    Object? htmlUrl = freezed,
    Object? description = freezed,
    Object? owner = freezed,
    Object? language = freezed,
    Object? startsCount = freezed,
    Object? watchersCount = freezed,
    Object? forksCount = freezed,
    Object? issuesCount = freezed,
    Object? isPrivate = freezed,
    Object? isArchived = freezed,
    Object? isDisabled = freezed,
  }) {
    return _then(_$RepoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerModel?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      startsCount: freezed == startsCount
          ? _value.startsCount
          : startsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      watchersCount: freezed == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      forksCount: freezed == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      issuesCount: freezed == issuesCount
          ? _value.issuesCount
          : issuesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDisabled: freezed == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepoModelImpl with DiagnosticableTreeMixin implements _RepoModel {
  const _$RepoModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'full_name') required this.fullName,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      required this.description,
      required this.owner,
      required this.language,
      @JsonKey(name: 'stargazers_count') required this.startsCount,
      @JsonKey(name: 'watchers_count') required this.watchersCount,
      @JsonKey(name: 'forks_count') required this.forksCount,
      @JsonKey(name: 'open_issues_count') required this.issuesCount,
      @JsonKey(name: 'private') required this.isPrivate,
      @JsonKey(name: 'archived') required this.isArchived,
      @JsonKey(name: 'disabled') required this.isDisabled});

  factory _$RepoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepoModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @override
  final String? description;
  @override
  final OwnerModel? owner;
  @override
  final String? language;
  @override
  @JsonKey(name: 'stargazers_count')
  final int? startsCount;
  @override
  @JsonKey(name: 'watchers_count')
  final int? watchersCount;
  @override
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  final int? issuesCount;
  @override
  @JsonKey(name: 'private')
  final bool? isPrivate;
  @override
  @JsonKey(name: 'archived')
  final bool? isArchived;
  @override
  @JsonKey(name: 'disabled')
  final bool? isDisabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepoModel(id: $id, name: $name, fullName: $fullName, htmlUrl: $htmlUrl, description: $description, owner: $owner, language: $language, startsCount: $startsCount, watchersCount: $watchersCount, forksCount: $forksCount, issuesCount: $issuesCount, isPrivate: $isPrivate, isArchived: $isArchived, isDisabled: $isDisabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepoModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('htmlUrl', htmlUrl))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('owner', owner))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('startsCount', startsCount))
      ..add(DiagnosticsProperty('watchersCount', watchersCount))
      ..add(DiagnosticsProperty('forksCount', forksCount))
      ..add(DiagnosticsProperty('issuesCount', issuesCount))
      ..add(DiagnosticsProperty('isPrivate', isPrivate))
      ..add(DiagnosticsProperty('isArchived', isArchived))
      ..add(DiagnosticsProperty('isDisabled', isDisabled));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.startsCount, startsCount) ||
                other.startsCount == startsCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.issuesCount, issuesCount) ||
                other.issuesCount == issuesCount) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      fullName,
      htmlUrl,
      description,
      owner,
      language,
      startsCount,
      watchersCount,
      forksCount,
      issuesCount,
      isPrivate,
      isArchived,
      isDisabled);

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoModelImplCopyWith<_$RepoModelImpl> get copyWith =>
      __$$RepoModelImplCopyWithImpl<_$RepoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepoModelImplToJson(
      this,
    );
  }
}

abstract class _RepoModel implements RepoModel {
  const factory _RepoModel(
          {required final int? id,
          required final String? name,
          @JsonKey(name: 'full_name') required final String? fullName,
          @JsonKey(name: 'html_url') required final String? htmlUrl,
          required final String? description,
          required final OwnerModel? owner,
          required final String? language,
          @JsonKey(name: 'stargazers_count') required final int? startsCount,
          @JsonKey(name: 'watchers_count') required final int? watchersCount,
          @JsonKey(name: 'forks_count') required final int? forksCount,
          @JsonKey(name: 'open_issues_count') required final int? issuesCount,
          @JsonKey(name: 'private') required final bool? isPrivate,
          @JsonKey(name: 'archived') required final bool? isArchived,
          @JsonKey(name: 'disabled') required final bool? isDisabled}) =
      _$RepoModelImpl;

  factory _RepoModel.fromJson(Map<String, dynamic> json) =
      _$RepoModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;
  @override
  String? get description;
  @override
  OwnerModel? get owner;
  @override
  String? get language;
  @override
  @JsonKey(name: 'stargazers_count')
  int? get startsCount;
  @override
  @JsonKey(name: 'watchers_count')
  int? get watchersCount;
  @override
  @JsonKey(name: 'forks_count')
  int? get forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  int? get issuesCount;
  @override
  @JsonKey(name: 'private')
  bool? get isPrivate;
  @override
  @JsonKey(name: 'archived')
  bool? get isArchived;
  @override
  @JsonKey(name: 'disabled')
  bool? get isDisabled;

  /// Create a copy of RepoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoModelImplCopyWith<_$RepoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
