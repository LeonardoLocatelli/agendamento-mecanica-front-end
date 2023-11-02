import 'dart:convert';

class Servico {
  String dataEntrada;
  String nomeCarro;
  int ano;
  String cpf;
  String telefone;
  String modelo;
  String nomeDono;
  String descricaoProblema;
  String dataPrevisaoSaida;
  String mecanicoEncarregado;

  Servico({
    required this.dataEntrada,
    required this.nomeCarro,
    required this.ano,
    required this.cpf,
    required this.telefone,
    required this.modelo,
    required this.nomeDono,
    required this.descricaoProblema,
    required this.dataPrevisaoSaida,
    required this.mecanicoEncarregado,
  });
}