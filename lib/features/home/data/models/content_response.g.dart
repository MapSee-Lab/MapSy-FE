// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentItemModelImpl _$$ContentItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$ContentItemModelImpl(
  id: json['id'] as String,
  platform: json['platform'] as String?,
  status: json['status'] as String?,
  platformUploader: json['platformUploader'] as String?,
  caption: json['caption'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  originalUrl: json['originalUrl'] as String?,
  title: json['title'] as String?,
  summary: json['summary'] as String?,
  lastCheckedAt: json['lastCheckedAt'] as String?,
);

Map<String, dynamic> _$$ContentItemModelImplToJson(
  _$ContentItemModelImpl instance,
) => <String, dynamic>{
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

_$RecentContentResponseImpl _$$RecentContentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecentContentResponseImpl(
  contents:
      (json['contents'] as List<dynamic>?)
          ?.map((e) => ContentItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RecentContentResponseImplToJson(
  _$RecentContentResponseImpl instance,
) => <String, dynamic>{'contents': instance.contents};

_$MemberContentPageResponseImpl _$$MemberContentPageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MemberContentPageResponseImpl(
  contentPage: ContentPage.fromJson(
    json['contentPage'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$MemberContentPageResponseImplToJson(
  _$MemberContentPageResponseImpl instance,
) => <String, dynamic>{'contentPage': instance.contentPage};

_$ContentPageImpl _$$ContentPageImplFromJson(Map<String, dynamic> json) =>
    _$ContentPageImpl(
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => ContentItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      number: (json['number'] as num?)?.toInt() ?? 0,
      first: json['first'] as bool? ?? true,
      last: json['last'] as bool? ?? true,
      empty: json['empty'] as bool? ?? true,
    );

Map<String, dynamic> _$$ContentPageImplToJson(_$ContentPageImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'last': instance.last,
      'empty': instance.empty,
    };
