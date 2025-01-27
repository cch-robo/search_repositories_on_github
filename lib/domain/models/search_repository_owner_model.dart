import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_repository_owner_model.freezed.dart';
part 'search_repository_owner_model.g.dart';

@freezed
class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    @JsonKey(name: 'login') required String? ownerName,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
  }) = _OwnerModel;

  factory OwnerModel.fromJson(Map<String, Object?> json) =>
      _$OwnerModelFromJson(json);
}
