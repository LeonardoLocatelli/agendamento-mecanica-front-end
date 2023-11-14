import 'dart:convert';

import '../model/Cliente.dart';
import 'http_post.dart';

class ClienteHttp {
  static Future<bool> cadastrarCliente(
      String nome, String cpf, String telefone, String marca, int ano, String modelo) async {
    bool retorno;
    try {
      var response = await HttpPost.post(
        url: "/api/cadastrarCliente",
        body: {
          "nome": nome,
          "telefone": telefone,
          "cpf": cpf,
          "marca": marca,
          "ano": ano,
          "modelo": modelo,
          },
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

   static Future<List<Cliente>> buscarListaCliente() async {
    try {
      var response = await HttpPost.post(url: "/api/buscarListaCliente");

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        List<Cliente> clientes = (responseData['data'] as List<dynamic>?)
                ?.map((e) => Cliente.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

        return clientes;
      } else {
        throw Exception("Erro na resposta do servidor");
      }
    } catch (exception) {
      rethrow;
    }
  }

  
  static Future<bool> excluirCliente(String id) async {
    bool retorno;
    try {
      var response = await HttpPost.post(
        url: "/api/excluirCliente/$id"
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