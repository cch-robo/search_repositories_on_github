import 'package:freezed_annotation/freezed_annotation.dart';

import 'person.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  @JsonSerializable(explicitToJson: true)
  const factory Team({
    @JsonKey(name: 'team_id') required String teamId,
    required List<Person> persons,
  }) = _Team;

  factory Team.fromJson(Map<String, Object?> json) => _$TeamFromJson(json);
}
