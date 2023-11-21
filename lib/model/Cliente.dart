import 'dart:convert';

class Cliente {
  String id;
  String dono;
  String cpf;
  String telefone;
  String marca;
  int ano;
  String modelo;

  Cliente({
    required this.id,
    required this.marca,
    required this.ano,
    required this.cpf,
    required this.telefone,
    required this.modelo,
    required this.dono,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      marca: json['marca'],
      ano: json['ano'],
      cpf: json['cpf'],
      telefone: json['telefone'],
      modelo: json['modelo'],
      dono: json['dono'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'ano': ano,
      'cpf': cpf,
      'telefone': telefone,
      'modelo': modelo,
      'dono': dono,
    };
  }
}
