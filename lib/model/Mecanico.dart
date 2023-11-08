class Mecanico {
  String? id;
  String nome;
  String telefone;
  String cpf;
  double? salario;

  Mecanico({
    this.id = "",
    required this.nome,
    required this.telefone,
    required this.cpf,
    this.salario,
  });

  factory Mecanico.fromJson(Map<String, dynamic> json) {
    return Mecanico(
      id: json['_id'],
      nome: json['nome'],
      telefone: json['telefone'],
      cpf: json['cpf'],
      salario: json['salario'] != null ? json['salario'].toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      '_id': id,
      'nome': nome,
      'telefone': telefone,
      'cpf': cpf,
    };
    if (salario != null) {
      data['salario'] = salario;
    }
    return data;
  }
}
