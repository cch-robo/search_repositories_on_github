// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repository_owner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) {
  return _OwnerModel.fromJson(json);
}

/// @nodoc
mixin _$OwnerModel {
  @JsonKey(name: 'login')
  String? get ownerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this OwnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerModelCopyWith<OwnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerModelCopyWith<$Res> {
  factory $OwnerModelCopyWith(
          OwnerModel value, $Res Function(OwnerModel) then) =
      _$OwnerModelCopyWithImpl<$Res, OwnerModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String? ownerName,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class _$OwnerModelCopyWithImpl<$Res, $Val extends OwnerModel>
    implements $OwnerModelCopyWith<$Res> {
  _$OwnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerName = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerModelImplCopyWith<$Res>
    implements $OwnerModelCopyWith<$Res> {
  factory _$$OwnerModelImplCopyWith(
          _$OwnerModelImpl value, $Res Function(_$OwnerModelImpl) then) =
      __$$OwnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String? ownerName,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class __$$OwnerModelImplCopyWithImpl<$Res>
    extends _$OwnerModelCopyWithImpl<$Res, _$OwnerModelImpl>
    implements _$$OwnerModelImplCopyWith<$Res> {
  __$$OwnerModelImplCopyWithImpl(
      _$OwnerModelImpl _value, $Res Function(_$OwnerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerName = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$OwnerModelImpl(
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerModelImpl implements _OwnerModel {
  const _$OwnerModelImpl(
      {@JsonKey(name: 'login') required this.ownerName,
      @JsonKey(name: 'avatar_url') required this.avatarUrl});

  factory _$OwnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerModelImplFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String? ownerName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'OwnerModel(ownerName: $ownerName, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerModelImpl &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ownerName, avatarUrl);

  /// Create a copy of OwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerModelImplCopyWith<_$OwnerModelImpl> get copyWith =>
      __$$OwnerModelImplCopyWithImpl<_$OwnerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerModelImplToJson(
      this,
    );
  }
}

abstract class _OwnerModel implements OwnerModel {
  const factory _OwnerModel(
          {@JsonKey(name: 'login') required final String? ownerName,
          @JsonKey(name: 'avatar_url') required final String? avatarUrl}) =
      _$OwnerModelImpl;

  factory _OwnerModel.fromJson(Map<String, dynamic> json) =
      _$OwnerModelImpl.fromJson;

  @override
  @JsonKey(name: 'login')
  String? get ownerName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// Create a copy of OwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerModelImplCopyWith<_$OwnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}