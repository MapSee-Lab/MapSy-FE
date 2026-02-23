// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateFolderRequestImpl _$$CreateFolderRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateFolderRequestImpl(
  name: json['name'] as String,
  visibility: json['visibility'] as String? ?? 'PRIVATE',
);

Map<String, dynamic> _$$CreateFolderRequestImplToJson(
  _$CreateFolderRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'visibility': instance.visibility,
};

_$CreateFolderResponseImpl _$$CreateFolderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateFolderResponseImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  visibility: json['visibility'] as String,
  isDefault: json['isDefault'] as bool? ?? false,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$$CreateFolderResponseImplToJson(
  _$CreateFolderResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'visibility': instance.visibility,
  'isDefault': instance.isDefault,
  'createdAt': instance.createdAt,
};
