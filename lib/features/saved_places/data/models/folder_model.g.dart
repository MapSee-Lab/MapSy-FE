// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderModelImpl _$$FolderModelImplFromJson(Map<String, dynamic> json) =>
    _$FolderModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      visibility: json['visibility'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      isDefault: json['isDefault'] as bool? ?? false,
      placeCount: (json['placeCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$FolderModelImplToJson(_$FolderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visibility': instance.visibility,
      'thumbnailUrl': instance.thumbnailUrl,
      'isDefault': instance.isDefault,
      'placeCount': instance.placeCount,
      'createdAt': instance.createdAt,
    };

_$GetFoldersResponseImpl _$$GetFoldersResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GetFoldersResponseImpl(
  folders:
      (json['folders'] as List<dynamic>?)
          ?.map((e) => FolderModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$GetFoldersResponseImplToJson(
  _$GetFoldersResponseImpl instance,
) => <String, dynamic>{'folders': instance.folders};
