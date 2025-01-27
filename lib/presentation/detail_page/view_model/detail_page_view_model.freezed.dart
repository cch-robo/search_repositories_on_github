// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailPageModelState {
  RepoModel? get repo => throw _privateConstructorUsedError;

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailPageModelStateCopyWith<DetailPageModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPageModelStateCopyWith<$Res> {
  factory $DetailPageModelStateCopyWith(DetailPageModelState value,
          $Res Function(DetailPageModelState) then) =
      _$DetailPageModelStateCopyWithImpl<$Res, DetailPageModelState>;
  @useResult
  $Res call({RepoModel? repo});

  $RepoModelCopyWith<$Res>? get repo;
}

/// @nodoc
class _$DetailPageModelStateCopyWithImpl<$Res,
        $Val extends DetailPageModelState>
    implements $DetailPageModelStateCopyWith<$Res> {
  _$DetailPageModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = freezed,
  }) {
    return _then(_value.copyWith(
      repo: freezed == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as RepoModel?,
    ) as $Val);
  }

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepoModelCopyWith<$Res>? get repo {
    if (_value.repo == null) {
      return null;
    }

    return $RepoModelCopyWith<$Res>(_value.repo!, (value) {
      return _then(_value.copyWith(repo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailPageModelStateImplCopyWith<$Res>
    implements $DetailPageModelStateCopyWith<$Res> {
  factory _$$DetailPageModelStateImplCopyWith(_$DetailPageModelStateImpl value,
          $Res Function(_$DetailPageModelStateImpl) then) =
      __$$DetailPageModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RepoModel? repo});

  @override
  $RepoModelCopyWith<$Res>? get repo;
}

/// @nodoc
class __$$DetailPageModelStateImplCopyWithImpl<$Res>
    extends _$DetailPageModelStateCopyWithImpl<$Res, _$DetailPageModelStateImpl>
    implements _$$DetailPageModelStateImplCopyWith<$Res> {
  __$$DetailPageModelStateImplCopyWithImpl(_$DetailPageModelStateImpl _value,
      $Res Function(_$DetailPageModelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = freezed,
  }) {
    return _then(_$DetailPageModelStateImpl(
      repo: freezed == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as RepoModel?,
    ));
  }
}

/// @nodoc

class _$DetailPageModelStateImpl implements _DetailPageModelState {
  const _$DetailPageModelStateImpl({required this.repo});

  @override
  final RepoModel? repo;

  @override
  String toString() {
    return 'DetailPageModelState(repo: $repo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPageModelStateImpl &&
            (identical(other.repo, repo) || other.repo == repo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repo);

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailPageModelStateImplCopyWith<_$DetailPageModelStateImpl>
      get copyWith =>
          __$$DetailPageModelStateImplCopyWithImpl<_$DetailPageModelStateImpl>(
              this, _$identity);
}

abstract class _DetailPageModelState implements DetailPageModelState {
  const factory _DetailPageModelState({required final RepoModel? repo}) =
      _$DetailPageModelStateImpl;

  @override
  RepoModel? get repo;

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailPageModelStateImplCopyWith<_$DetailPageModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
