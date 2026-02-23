// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentItemImpl _$$ContentItemImplFromJson(Map<String, dynamic> json) =>
    _$ContentItemImpl(
      contentId: (json['contentId'] as num).toInt(),
      sourceUrl: json['sourceUrl'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      places:
          (json['places'] as List<dynamic>?)
              ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContentItemImplToJson(_$ContentItemImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'sourceUrl': instance.sourceUrl,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'places': instance.places,
    };

_$ContentListResponseImpl _$$ContentListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ContentListResponseImpl(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  cursor: json['cursor'] == null
      ? null
      : CursorModel.fromJson(json['cursor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ContentListResponseImplToJson(
  _$ContentListResponseImpl instance,
) => <String, dynamic>{'content': instance.content, 'cursor': instance.cursor};
