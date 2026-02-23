import 'models/check_name_response.dart';

abstract class MypageRepository {
  Future<CheckNameResponse> checkName(String name);
  Future<void> updateNickname(String name);
}
