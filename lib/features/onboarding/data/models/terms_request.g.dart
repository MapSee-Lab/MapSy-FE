// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermsRequestImpl _$$TermsRequestImplFromJson(Map<String, dynamic> json) =>
    _$TermsRequestImpl(
      isServiceTermsAndPrivacyAgreed:
          json['isServiceTermsAndPrivacyAgreed'] as bool,
      isMarketingAgreed: json['isMarketingAgreed'] as bool? ?? false,
    );

Map<String, dynamic> _$$TermsRequestImplToJson(_$TermsRequestImpl instance) =>
    <String, dynamic>{
      'isServiceTermsAndPrivacyAgreed': instance.isServiceTermsAndPrivacyAgreed,
      'isMarketingAgreed': instance.isMarketingAgreed,
    };
