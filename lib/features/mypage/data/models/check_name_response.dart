import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_name_response.freezed.dart';
part 'check_name_response.g.dart';

@freezed
class CheckNameResponse with _$CheckNameResponse {
  const factory CheckNameResponse({
    required bool isAvailable,
    required String name,
  }) = _CheckNameResponse;

  factory CheckNameResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckNameResponseFromJson(json);
}
