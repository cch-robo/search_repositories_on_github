// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_condition_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchConditionState {
  Condition get condition => throw _privateConstructorUsedError;

  /// Create a copy of SearchConditionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchConditionStateCopyWith<SearchConditionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchConditionStateCopyWith<$Res> {
  factory $SearchConditionStateCopyWith(SearchConditionState value,
          $Res Function(SearchConditionState) then) =
      _$SearchConditionStateCopyWithImpl<$Res, SearchConditionState>;
  @useResult
  $Res call({Condition condition});
}

/// @nodoc
class _$SearchConditionStateCopyWithImpl<$Res,
        $Val extends SearchConditionState>
    implements $SearchConditionStateCopyWith<$Res> {
  _$SearchConditionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchConditionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
  }) {
    return _then(_value.copyWith(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Condition,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchConditionStateImplCopyWith<$Res>
    implements $SearchConditionStateCopyWith<$Res> {
  factory _$$SearchConditionStateImplCopyWith(_$SearchConditionStateImpl value,
          $Res Function(_$SearchConditionStateImpl) then) =
      __$$SearchConditionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Condition condition});
}

/// @nodoc
class __$$SearchConditionStateImplCopyWithImpl<$Res>
    extends _$SearchConditionStateCopyWithImpl<$Res, _$SearchConditionStateImpl>
    implements _$$SearchConditionStateImplCopyWith<$Res> {
  __$$SearchConditionStateImplCopyWithImpl(_$SearchConditionStateImpl _value,
      $Res Function(_$SearchConditionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchConditionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
  }) {
    return _then(_$SearchConditionStateImpl(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Condition,
    ));
  }
}

/// @nodoc

class _$SearchConditionStateImpl implements _SearchConditionState {
  const _$SearchConditionStateImpl({required this.condition});

  @override
  final Condition condition;

  @override
  String toString() {
    return 'SearchConditionState(condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchConditionStateImpl &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condition);

  /// Create a copy of SearchConditionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchConditionStateImplCopyWith<_$SearchConditionStateImpl>
      get copyWith =>
          __$$SearchConditionStateImplCopyWithImpl<_$SearchConditionStateImpl>(
              this, _$identity);
}

abstract class _SearchConditionState implements SearchConditionState {
  const factory _SearchConditionState({required final Condition condition}) =
      _$SearchConditionStateImpl;

  @override
  Condition get condition;

  /// Create a copy of SearchConditionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchConditionStateImplCopyWith<_$SearchConditionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
