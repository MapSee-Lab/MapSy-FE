// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CursorModelImpl _$$CursorModelImplFromJson(Map<String, dynamic> json) =>
    _$CursorModelImpl(
      hasNext: json['hasNext'] as bool? ?? false,
      nextCursor: (json['nextCursor'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CursorModelImplToJson(_$CursorModelImpl instance) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'nextCursor': instance.nextCursor,
      'size': instance.size,
    };
