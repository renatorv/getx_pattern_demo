import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<RequestToken> newRequestToken() async {
    final Response response = await _dio.get(
      '/authentication/token/new',
      queryParameters: {
        "api_key": Constants.THE_MOVIE_DB_API,
      },
    );

    return RequestToken.fromJson(response.data);
  }

  Future<RequestToken> validateWithLogin({
    @required String username,
    @required String password,
    @required String requestToke,
  }) async {
    final Response response = await _dio.post(
      '/authentication/token/validate_with_login',
      queryParameters: {
        "api_key": Constants.THE_MOVIE_DB_API,
      },
      data: {
        "username": username,
        "password": password,
        "request_token": requestToke,
      },
    );

    return RequestToken.fromJson(response.data);
  }
}

// {
//   "success": true,
//   "expires_at": "2016-08-26 17:04:39 UTC",
//   "request_token": "ff5c7eeb5a8870efe3cd7fc5c282cffd26800ecd"
// }

//https://api.themoviedb.org/3/authentication/token/new?api_key=<<api_key>>
//renatorv
// tmdb147172
