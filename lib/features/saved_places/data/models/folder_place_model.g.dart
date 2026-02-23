// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFolderPlacesResponseImpl _$$GetFolderPlacesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GetFolderPlacesResponseImpl(
  folderId: json['folderId'] as String,
  folderName: json['folderName'] as String,
  places:
      (json['places'] as List<dynamic>?)
          ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$GetFolderPlacesResponseImplToJson(
  _$GetFolderPlacesResponseImpl instance,
) => <String, dynamic>{
  'folderId': instance.folderId,
  'folderName': instance.folderName,
  'places': instance.places,
};

_$AddFolderPlaceRequestImpl _$$AddFolderPlaceRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AddFolderPlaceRequestImpl(placeId: json['placeId'] as String);

Map<String, dynamic> _$$AddFolderPlaceRequestImplToJson(
  _$AddFolderPlaceRequestImpl instance,
) => <String, dynamic>{'placeId': instance.placeId};

_$AddFolderPlaceResponseImpl _$$AddFolderPlaceResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AddFolderPlaceResponseImpl(
  id: json['id'] as String,
  folderId: json['folderId'] as String,
  placeId: json['placeId'] as String,
  position: (json['position'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$$AddFolderPlaceResponseImplToJson(
  _$AddFolderPlaceResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'folderId': instance.folderId,
  'placeId': instance.placeId,
  'position': instance.position,
  'createdAt': instance.createdAt,
};
