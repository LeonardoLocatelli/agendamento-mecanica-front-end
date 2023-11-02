import 'dart:convert';

import 'package:agendamento_mecanica/screen/TelaInicial.dart';

import '../model/Servico.dart';
import 'http_post.dart';

class cadastraServicoHttp {
  static Future<bool> cadastraServico(String nome, String cpf, String telefone,
      String marca, int ano, String modelo, String descricao, String mecanico, String dataEntrada, String dataSaida) async {
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
    List<Servico> servicos = [];

    try {
      var response = await HttpPost.post(
        url: "/api/buscarListaServico"
      );

      var responseData = json.decode(utf8.decode(response.bodyBytes));

      if (responseData['statusCode'] == 200) {
        var data = responseData['data'];

        for (var item in data) {
          servicos.add(
            Servico(
              dataEntrada: item['dataEntrada'],
              nomeCarro: item['nomeCarro'],
              ano: int.parse(item['ano']),
              modelo: item['modelo'],
              nomeDono: item['nomeDono'],
              descricaoProblema: item['descricaoProblema'],
              dataPrevisaoSaida: item['dataSaida'],
              cpf: item['cpf'],
              telefone: item['telefone'],
              mecanicoEncarregado: item['mecanicoEncarregado'],
            ),
          );
        }
      }

      return servicos;
    } catch (exception) {
      rethrow;
    }
  }
}
