import 'dart:convert';

import 'http_post.dart';

class AdicionarLoginHttp {
  static Future<String> adicionaLogin(
      String nome, String email, String senha) async {
    try {
      var response = await HttpPost.post(
        url: "/api/adicionarLogin",
        body: {"nome": nome, "email": email, "senha": senha},
      );

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        // var listaItens = responseData['data']
        //     .map<Categorias>((list) => Categorias.fromJson(list))
        //     .toList();
        // listaItens.forEach((element) => lista.add(element));
      }
      return "";
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
}
