import 'dart:convert';

class Servico {
  String id;
  String dono;
  String cpf;
  String telefone;
  String marca;
  int ano;
  String modelo;
  String problema;
  String mecanico;
  String dataEntrada;
  String dataSaida;
  String situacao;

  Servico({
    required this.id,
    required this.dataEntrada,
    required this.marca,
    required this.ano,
    required this.cpf,
    required this.telefone,
    required this.modelo,
    required this.dono,
    required this.problema,
    required this.dataSaida,
    required this.mecanico,
    required this.situacao,
  });

factory Servico.fromJson(Map<String, dynamic> json) {
  return Servico(
    id: json['id'],
    dataEntrada: json['dataEntrada'],
    marca: json['marca'],
    ano: json['ano'],
    cpf: json['cpf'],
    telefone: json['telefone'],
    modelo: json['modelo'],
    dono: json['dono'],
    problema: json['problema'],
    dataSaida: json['dataSaida'],
    mecanico: json['mecanico'],
    situacao: json['situacao'],
  );
}

}