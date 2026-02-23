// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentDetailResponseImpl _$$ContentDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ContentDetailResponseImpl(
  content: ContentInfo.fromJson(json['content'] as Map<String, dynamic>),
  places:
      (json['places'] as List<dynamic>?)
          ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ContentDetailResponseImplToJson(
  _$ContentDetailResponseImpl instance,
) => <String, dynamic>{'content': instance.content, 'places': instance.places};

_$ContentInfoImpl _$$ContentInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContentInfoImpl(
      id: json['id'] as String,
      platform: json['platform'] as String?,
      status: json['status'] as String,
      platformUploader: json['platformUploader'] as String?,
      caption: json['caption'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      originalUrl: json['originalUrl'] as String?,
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      lastCheckedAt: json['lastCheckedAt'] as String?,
    );

Map<String, dynamic> _$$ContentInfoImplToJson(_$ContentInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'status': instance.status,
      'platformUploader': instance.platformUploader,
      'caption': instance.caption,
      'thumbnailUrl': instance.thumbnailUrl,
      'originalUrl': instance.originalUrl,
      'title': instance.title,
      'summary': instance.summary,
      'lastCheckedAt': instance.lastCheckedAt,
    };
