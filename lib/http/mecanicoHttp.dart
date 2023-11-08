import 'dart:convert';

import '../model/Mecanico.dart';
import 'http_post.dart';

class MecanicoHttp {
  static Future<bool> cadastrarMecanico(
      String nome, String telefone, String cpf, double salario) async {
    bool retorno;
    try {
      var response = await HttpPost.post(
        url: "/api/cadastrarMecanico",
        body: {
          "nome": nome,
          "telefone": telefone,
          "cpf": cpf,
          "salario": salario,
          
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

   static Future<List<Mecanico>> buscaListaMecanico() async {
    try {
      var response = await HttpPost.post(url: "/api/buscarListaMecanico");

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        List<Mecanico> mecanicos = (responseData['data'] as List<dynamic>?)
                ?.map((e) => Mecanico.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

        return mecanicos;
      } else {
        throw Exception("Erro na resposta do servidor");
      }
    } catch (exception) {
      rethrow;
    }
  }
}