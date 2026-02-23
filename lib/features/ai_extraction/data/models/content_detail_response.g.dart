// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentDetailResponseImpl _$$ContentDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ContentDetailResponseImpl(
      contentId: (json['contentId'] as num).toInt(),
      status: json['status'] as String,
      sourceUrl: json['sourceUrl'] as String?,
      places:
          (json['places'] as List<dynamic>?)
              ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContentDetailResponseImplToJson(
  _$ContentDetailResponseImpl instance,
) => <String, dynamic>{
      'contentId': instance.contentId,
      'status': instance.status,
      'sourceUrl': instance.sourceUrl,
      'places': instance.places,
    };
