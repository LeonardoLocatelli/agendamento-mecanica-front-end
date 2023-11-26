
import 'dart:convert';

class Mecanica {
  String nome;
  String email;

    Mecanica({
    required this.nome,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
    };
  }

  factory Mecanica.fromJson(Map<String, dynamic> json) {
    return Mecanica(
      nome: json['nome'],
      email: json['email'],
    );
  }
  String toJson() => json.encode(toMap());
}
