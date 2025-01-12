import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

// This code is taken from the example in the freezed library's README,
// Creating a Model using Freezed.
// https://pub.dev/packages/freezed#creating-a-model-using-freezed:~:text=%E3%83%A2%E3%83%87%E3%83%AB%E3%81%AE%E4%BD%9C%E6%88%90-,%23,-%E9%95%B7%E3%81%84%E6%8A%BD%E8%B1%A1%E7%9A%84

@freezed
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
