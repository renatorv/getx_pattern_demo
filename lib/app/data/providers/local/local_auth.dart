import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';

class LocalAuth {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  static const KEY = 'session';

  // Método para guardar dados da sessão do usuário
  Future<void> setSession(RequestToken requestToken) async {
    // o campo value, espera uma String, assim deve-se converter o objeto para String
    // com o método jsonEncode
    await _storage.write(
      key: KEY,
      value: jsonEncode(requestToken.toJson()),
    );
  }

  // Método para obter dados da sessão do usuário
  Future<RequestToken> getSession() async {
    final String data = await _storage.read(key: KEY);

    if (data != null) {
      final RequestToken requestToken = RequestToken.fromJson(jsonDecode(data));

      if (DateTime.now().isBefore(requestToken.expiresAt)) {
        return requestToken;
      }

      return null;
    }
    return null;
  }
}
