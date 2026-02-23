import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_model.freezed.dart';
part 'cursor_model.g.dart';

/// 커서 기반 페이지네이션 모델 (예비용)
@freezed
class CursorModel with _$CursorModel {
  const factory CursorModel({
    @Default(false) bool hasNext,
    int? nextCursor,
    @Default(0) int size,
  }) = _CursorModel;

  factory CursorModel.fromJson(Map<String, dynamic> json) =>
      _$CursorModelFromJson(json);
}
