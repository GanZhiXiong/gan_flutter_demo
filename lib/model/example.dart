import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'example.g.dart';

enum WaterMeterUnitEnum {
  GAL,
  CCF,
  M3,
  L;

  static const List<WaterMeterUnitEnum> all = [GAL, CCF, M3, L];

  static WaterMeterUnitEnum? fromName(String name) {
    return WaterMeterUnitEnum.values
        .firstWhereOrNull((element) => element.name == name);
  }
}

@JsonSerializable()
class Person {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateOfBirth;

  WaterMeterUnitEnum? waterMeterUnit;
  WaterMeterUnitEnum waterMeterUnit1;

  Person(
      {required this.firstName,
      required this.lastName,
      this.dateOfBirth,
      this.waterMeterUnit,
      this.waterMeterUnit1 = WaterMeterUnitEnum.GAL});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
