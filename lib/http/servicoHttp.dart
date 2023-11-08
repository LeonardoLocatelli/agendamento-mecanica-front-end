import 'dart:convert';

import '../model/Servico.dart';
import 'http_post.dart';

class cadastraServicoHttp {
  static Future<bool> cadastraServico(
      String nome,
      String cpf,
      String telefone,
      String marca,
      int ano,
      String modelo,
      String descricao,
      String mecanico,
      String dataEntrada,
      String dataSaida) async {
    bool retorno;

    try {
      var response = await HttpPost.post(
        url: "/api/cadastrarServico",
        body: {
          "nome": nome,
          "cpf": cpf,
          "telefone": telefone,
          "marca": marca,
          "ano": ano,
          "modelo": modelo,
          "problema": descricao,
          "mecanico": mecanico,
          "dataEntrada": dataEntrada,
          "dataSaida": dataSaida
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

  static Future<List<Servico>> buscaListaServico() async {
    try {
      var response = await HttpPost.post(url: "/api/buscarListaServico");

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        List<Servico> servicos = (responseData['data'] as List<dynamic>?)
                ?.map((e) => Servico.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

        return servicos;
      } else {
        throw Exception("Erro na resposta do servidor");
      }
    } catch (exception) {
      rethrow;
    }
  }

  static Future<bool> excluirServico(String id) async {
    bool retorno;
    try {
      var response = await HttpPost.post(
        url: "/api/excluirServico/$id"
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
