import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_model.freezed.dart';
part 'cursor_model.g.dart';

/// 커서 기반 페이지네이션 모델
@freezed
class CursorModel with _$CursorModel {
  const factory CursorModel({
    /// 다음 페이지 존재 여부
    @Default(false) bool hasNext,

    /// 다음 커서 값 (다음 페이지 요청 시 사용)
    int? nextCursor,

    /// 현재 페이지 아이템 수
    @Default(0) int size,
  }) = _CursorModel;

  factory CursorModel.fromJson(Map<String, dynamic> json) =>
      _$CursorModelFromJson(json);
}
