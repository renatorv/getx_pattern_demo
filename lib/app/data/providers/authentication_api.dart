import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  //AuthenticationAPI(this._dio);

  Future<RequestToken> newRequestToken() async {
    final Response response = await _dio.get(
      '/authentication/token/new',
      queryParameters: {
        "api_key": Constants.THE_MOVIE_DB_API,
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
