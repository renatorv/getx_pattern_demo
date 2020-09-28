import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/authentication_api.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<RequestToken> newRequestToken() => _api.newRequestToken();
  Future<RequestToken> authWithLogin({
    @required String username,
    @required String password,
    @required String requestToke,
  }) =>
      _api.validateWithLogin(
        username: username,
        password: password,
        requestToke: requestToke,
      );
}
