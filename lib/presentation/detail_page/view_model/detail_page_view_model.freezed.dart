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
  int get index => throw _privateConstructorUsedError;

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
  $Res call({int index});
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
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
  $Res call({int index});
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
    Object? index = null,
  }) {
    return _then(_$DetailPageModelStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DetailPageModelStateImpl implements _DetailPageModelState {
  const _$DetailPageModelStateImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'DetailPageModelState(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPageModelStateImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

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
  const factory _DetailPageModelState({required final int index}) =
      _$DetailPageModelStateImpl;

  @override
  int get index;

  /// Create a copy of DetailPageModelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailPageModelStateImplCopyWith<_$DetailPageModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
