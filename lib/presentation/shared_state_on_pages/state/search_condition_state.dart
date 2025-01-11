import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_condition_state.freezed.dart';

///検索の状態を表すモデルです。
@freezed
class SearchConditionState with _$SearchConditionState {
  const factory SearchConditionState({
    required Condition condition,
  }) = _SearchConditionState;
}

/// 検索コンディション
enum Condition {
  /// 検索前
  before,

  /// 検索中
  searching,

  /// エラー終了
  error,

  /// 成功終了
  complete;
}
