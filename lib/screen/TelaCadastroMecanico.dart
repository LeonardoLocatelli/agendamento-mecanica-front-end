import 'package:agendamento_mecanica/http/mecanicoHttp.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';

class TelaCadastroMecanico extends StatefulWidget {
  @override
  _TelaCadastroMecanicoState createState() => _TelaCadastroMecanicoState();
}

class _TelaCadastroMecanicoState extends State<TelaCadastroMecanico> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController salarioController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    telefoneController.dispose();
    cpfController.dispose();
    salarioController.dispose();
    super.dispose();
  }

  void limparFormulario(){
    nomeController.clear();
    telefoneController.clear();
    cpfController.clear();
    salarioController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed(RotasProjeto.TELA_PERFIL);
          },
        ),
        title: Text(
          'Cadastro de Mecânico',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Material(
            borderRadius: BorderRadiusDirectional.circular(5),
            elevation: 5,
            color: Color.fromARGB(88, 95, 95, 95),
            child: Container(
              margin: EdgeInsets.all(20),
              width: 600,
              height: 600,
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Cadastro Mecânico',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 36,
                      ),
                    ),
                    TextFormField(
                      controller: nomeController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Nome do Mecânico',
                        labelStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o nome do mecânico.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: telefoneController,
                      style: TextStyle(color: Colors.white),
                      inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                         TelefoneInputFormatter()
                        ],
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        labelStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o telefone.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: cpfController,
                      style: TextStyle(color: Colors.white),
                      inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                         CpfInputFormatter()
                        ],
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        labelStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o CPF.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: salarioController,
                      style: TextStyle(color: Colors.white),
                      inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                         RealInputFormatter()
                        ],
                      decoration: InputDecoration(
                        labelText: 'Salário',
                        labelStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o salário.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                         var retorno = await MecanicoHttp.cadastrarMecanico(nomeController.text, telefoneController.text, cpfController.text, double.tryParse(salarioController.text) ?? 0.0);
                            if (retorno == true) {
                              FlushBarComponente.mostrar(
                                context,
                                "Cadastrado com sucesso!",
                                Icons.check,
                                Color.fromARGB(255, 64, 223, 15),
                              );
                              limparFormulario();
                            } else {
                              FlushBarComponente.mostrar(
                                context,
                                "Não foi possível realizar o Cadastro!",
                                Icons.close,
                                Color.fromARGB(255, 223, 12, 12),
                              );
                            }
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
      ),
    );
  }
}
