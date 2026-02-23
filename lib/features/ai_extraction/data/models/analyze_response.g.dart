// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyzeResponseImpl _$$AnalyzeResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyzeResponseImpl(
  contentId: json['contentId'] as String,
  memberId: json['memberId'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$$AnalyzeResponseImplToJson(
  _$AnalyzeResponseImpl instance,
) => <String, dynamic>{
  'contentId': instance.contentId,
  'memberId': instance.memberId,
  'status': instance.status,
};
