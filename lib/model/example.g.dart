// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      waterMeterUnit: $enumDecodeNullable(
          _$WaterMeterUnitEnumEnumMap, json['waterMeterUnit']),
      waterMeterUnit1: $enumDecodeNullable(
              _$WaterMeterUnitEnumEnumMap, json['waterMeterUnit1']) ??
          WaterMeterUnitEnum.GAL,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'waterMeterUnit': _$WaterMeterUnitEnumEnumMap[instance.waterMeterUnit],
      'waterMeterUnit1': _$WaterMeterUnitEnumEnumMap[instance.waterMeterUnit1]!,
    };

const _$WaterMeterUnitEnumEnumMap = {
  WaterMeterUnitEnum.GAL: 'GAL',
  WaterMeterUnitEnum.CCF: 'CCF',
  WaterMeterUnitEnum.M3: 'M3',
  WaterMeterUnitEnum.L: 'L',
};
