import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CadastroServico extends StatefulWidget {
  @override
  _CadastroServicoState createState() => _CadastroServicoState();
}

class _CadastroServicoState extends State<CadastroServico> {
  final _formKey = GlobalKey<FormState>();
  MaskedTextController cpfController = MaskedTextController(mask: '000.000.000-00');
  MaskedTextController telefoneController = MaskedTextController(mask: '(00) 00000-0000');
  String nomeDonoCarro = '';
  String marcaCarro = '';
  String ano = '';
  String modelo = '';
  String descricaoProblema = '';

  @override
  void dispose() {
    cpfController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro de Serviço',
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            width: 400.0,
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: InputDecoration(
                      labelText: 'Nome do dono do carro',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira o nome do dono do carro';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nomeDonoCarro = value!;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    controller: cpfController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (cpfController.text.isEmpty) {
                        return 'Por favor, insira o CPF';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    controller: telefoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (telefoneController.text.isEmpty) {
                        return 'Por favor, insira o telefone';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: InputDecoration(
                      labelText: 'Marca do carro',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira a marca do carro';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      marcaCarro = value!;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: InputDecoration(
                      labelText: 'Ano',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira o ano do carro';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      ano = value!;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: InputDecoration(
                      labelText: 'Modelo',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira o modelo do carro';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      modelo = value!;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.orange),
                    decoration: InputDecoration(
                      labelText: 'Descrição do problema',
                      labelStyle: TextStyle(color: Colors.orange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira a descrição do problema';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      descricaoProblema = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Faça algo com os dados, por exemplo, envie para um servidor.
                        print('Nome do dono do carro: $nomeDonoCarro');
                        print('CPF: ${cpfController.text}');
                        print('Telefone: ${telefoneController.text}');
                        print('Marca do carro: $marcaCarro');
                        print('Ano: $ano');
                        print('Modelo: $modelo');
                        print('Descrição do problema: $descricaoProblema');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
