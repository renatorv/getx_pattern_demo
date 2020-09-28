import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/authentication_api.dart';
import 'package:getx_pattern_demo/app/data/repositories/authentication_repository.dart';

// class MockAuthenticationAPI implements AuthenticationAPI {
//   @override
//   Future<RequestToken> newRequestToken() {
//     throw Exception("Simulação de erro!!");
//   }
// }

class DependencyInjection {
  // Realiza a injeção de depência
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage());

    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
      ),
    );
    Get.lazyPut<AuthenticationAPI>(
      () => AuthenticationAPI(),
    );
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepository(),
    );
  }
}
