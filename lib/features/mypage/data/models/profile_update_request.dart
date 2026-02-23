import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_request.freezed.dart';
part 'profile_update_request.g.dart';

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    required String name,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}
