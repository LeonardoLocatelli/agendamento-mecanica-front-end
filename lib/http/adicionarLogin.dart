import 'dart:convert';

import '../model/Mecanica.dart';
import 'http_post.dart';

class AdicionarLoginHttp {
  static Future<bool> adicionaLogin(
      String nome, String email, String senha) async {
    bool retorno;
    try {
      var response = await HttpPost.post(
        url: "/api/adicionarLogin",
        body: {"nome": nome, "email": email, "senha": senha},
      );

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        retorno = true;
      } else {
        retorno = false;
      }
      return retorno;
    } catch (exception) {
      rethrow;
    }
  }

  static Future<bool> logar(String email, String senha) async {
    bool retorno;
    try {
      var response = await HttpPost.post(
        url: "/api/logar",
        body: {"email": email, "senha": senha},
      );

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        retorno = true;
      } else {
        retorno = false;
      }

      return retorno;
    } catch (exception) {
      rethrow;
    }
  }

  static Future<Mecanica> buscaPerfilMecanica() async {
    try {
      var response = await HttpPost.post(url: "/api/buscaPerfilMecanica");

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        Map<String, dynamic> data = responseData['data'];

        Mecanica mecanica = Mecanica.fromJson(data);
        return mecanica;
      } else {
        throw Exception("Erro na resposta do servidor");
      }
    } catch (exception) {
      rethrow;
    }
  }
}
