import 'package:agendamento_mecanica/http/servicoHttp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';

class TelaCadastroServico extends StatefulWidget {
  @override
  _TelaCadastroServicoState createState() => _TelaCadastroServicoState();
}

class _TelaCadastroServicoState extends State<TelaCadastroServico> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController nomeDonoCarroController = TextEditingController();
  TextEditingController marcaCarroController = TextEditingController();
  TextEditingController anoController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController descricaoProblemaController = TextEditingController();
  TextEditingController mecanicoController = TextEditingController();
  TextEditingController dataEntradaController = TextEditingController();
  TextEditingController dataPrevisaoSaidaController = TextEditingController();

  @override
  void dispose() {
    cpfController.dispose();
    telefoneController.dispose();
    nomeDonoCarroController.dispose();
    marcaCarroController.dispose();
    anoController.dispose();
    modeloController.dispose();
    descricaoProblemaController.dispose();
    mecanicoController.dispose();
    dataEntradaController.dispose();
    dataPrevisaoSaidaController.dispose();
    super.dispose();
  }

  void limparFormulario() {
    nomeDonoCarroController.clear();
    cpfController.clear();
    telefoneController.clear();
    marcaCarroController.clear();
    anoController.clear();
    modeloController.clear();
    descricaoProblemaController.clear();
    mecanicoController.clear();
    dataEntradaController.clear();
    dataPrevisaoSaidaController.clear();
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
            Get.toNamed(RotasProjeto.TELA_INICIAL);
          },
        ),
        title: Text(
          'Cadastro de Serviço',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadiusDirectional.circular(5),
              elevation: 5,
              color: Color.fromARGB(88, 95, 95, 95),
              child: Container(
                margin: EdgeInsets.all(20),
                width: 600,
                height: 900,
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Nome do dono do carro',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: nomeDonoCarroController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira o nome do dono do carro';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: cpfController,
                        keyboardType: TextInputType.number,
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
                          if (cpfController.text.isEmpty) {
                            return 'Por favor, insira o CPF';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: telefoneController,
                        keyboardType: TextInputType.number,
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
                          if (telefoneController.text.isEmpty) {
                            return 'Por favor, insira o telefone';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Marca do carro',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: marcaCarroController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira a marca do carro';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Ano',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: anoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira o ano do carro';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Modelo',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: modeloController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira o modelo do carro';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Descrição do problema',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: descricaoProblemaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira a descrição do problema';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Mecânico',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: mecanicoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira o nome do mecânico';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Data de Entrada',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: dataEntradaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira a data de entrada';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Data de Previsão de Saída',
                          labelStyle: TextStyle(color: Colors.orange),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                          ),
                        ),
                        controller: dataPrevisaoSaidaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira a data de previsão de saída';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var retorno =
                                await cadastraServicoHttp.cadastraServico(
                              nomeDonoCarroController.text,
                              cpfController.text,
                              telefoneController.text,
                              marcaCarroController.text,
                              int.parse(anoController.text),
                              modeloController.text,
                              descricaoProblemaController.text,
                              mecanicoController.text,
                              dataEntradaController.text,
                              dataPrevisaoSaidaController.text,
                            );
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
      ),
    );
  }
}
