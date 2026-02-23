// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_folder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateFolderRequestImpl _$$UpdateFolderRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateFolderRequestImpl(
  name: json['name'] as String?,
  visibility: json['visibility'] as String?,
);

Map<String, dynamic> _$$UpdateFolderRequestImplToJson(
  _$UpdateFolderRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'visibility': instance.visibility,
};

_$UpdateFolderResponseImpl _$$UpdateFolderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateFolderResponseImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  visibility: json['visibility'] as String,
  isDefault: json['isDefault'] as bool? ?? false,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$$UpdateFolderResponseImplToJson(
  _$UpdateFolderResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'visibility': instance.visibility,
  'isDefault': instance.isDefault,
  'updatedAt': instance.updatedAt,
};
