import 'dart:convert';

import 'package:search_repositories_on_github/foundation/debug/debug_logger.dart';
import 'package:test/test.dart';

import 'freezed/person.dart';
import 'freezed/team.dart';

void main() {
  test('freezed json serialize/deserialize unit test', () {
    debugLog('freezed json serialize/deserialize unit test');

    // モデルデータを直接生成
    const Person peter = Person(
      firstName: 'Peter',
      lastName: 'Parker',
      age: 19,
    );
    const Person jane = Person(
      firstName: 'Merry Jane',
      lastName: 'Watson',
      age: 19,
    );
    const Team team1 =
        Team(teamId: 'Spider Man', persons: <Person>[peter, jane]);

    // モデルデータを Json Text から生成
    // ignore: missing_whitespace_between_adjacent_strings
    const String jsonText = '{"team_id":"Spider Man","persons":['
        '{"firstName":"Peter","lastName":"Parker","age":19},'
        '{"firstName":"Merry Jane","lastName":"Watson","age":19}]}';
    final Team team2 =
        Team.fromJson(json.decode(jsonText) as Map<String, dynamic>);

    debugLog('team1=${json.encode(team1.toJson())}');
    debugLog('team2=$jsonText');

    expect(
      team1,
      equals(team2),
    );

    expect(
      json.encode(team1.toJson()),
      equals(jsonText),
    );
  });
}
