// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileRequestImpl _$$ProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProfileRequestImpl(
      name: json['name'] as String,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      birthDate: json['birthDate'] as String?,
    );

Map<String, dynamic> _$$ProfileRequestImplToJson(
  _$ProfileRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'gender': _$GenderEnumMap[instance.gender],
  'birthDate': instance.birthDate,
};

const _$GenderEnumMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
  Gender.notSelected: 'NOT_SELECTED',
};

_$CheckNameResponseImpl _$$CheckNameResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckNameResponseImpl(
  isAvailable: json['isAvailable'] as bool,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$CheckNameResponseImplToJson(
  _$CheckNameResponseImpl instance,
) => <String, dynamic>{
  'isAvailable': instance.isAvailable,
  'name': instance.name,
};
