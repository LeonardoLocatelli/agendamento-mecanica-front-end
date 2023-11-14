import 'dart:convert';

class Cliente {
  String id;
  String dono;
  String cpf;
  String telefone;
  String marca;
  int ano;
  String modelo;
  String problema;

  Cliente({
    required this.id,
    required this.marca,
    required this.ano,
    required this.cpf,
    required this.telefone,
    required this.modelo,
    required this.dono,
    required this.problema,
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
      problema: json['problema'],
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
      'problema': problema,
    };
  }
}
