import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/repositories/authentication_repository.dart';

class HomeController extends GetxController {
  final _repository = Get.find<AuthenticationRepository>();

  String _username = '', _password = '';

  void onUsernameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<void> submit() async {
    try {
      // Recuperando o requestToken, passado da página de splash
      // Get.arguments é do tipo object, porém sabemos que ele contém uma String
      // final requestToken = Get.arguments as String;

      RequestToken requestToken = await _repository.newRequestToken();

      final RequestToken authRequestToken = await _repository.authWithLogin(
        username: _username,
        password: _password,
        requestToke: requestToken.requestToken,
      );

      print("requestToken: ${requestToken.expiresAt}");
    } catch (e) {
      print(e);
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }
      }
      Get.dialog(AlertDialog(
        title: Text("ERRO"),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ));
    }
  }
}
