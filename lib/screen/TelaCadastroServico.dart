import 'package:agendamento_mecanica/http/clienteHttp.dart';
import 'package:agendamento_mecanica/http/servicoHttp.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';
import '../http/mecanicoHttp.dart';
import '../model/Cliente.dart';
import '../model/Mecanico.dart';

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
  TextEditingController dataEntradaController = TextEditingController();
  TextEditingController dataPrevisaoSaidaController = TextEditingController();
  List<Mecanico> listaDeMecanicos = [];
  List<Cliente> listaDeClientes = [];
  String? selectedMecanico;
  String? selectedCliente;

  @override
  void dispose() {
    cpfController.dispose();
    telefoneController.dispose();
    nomeDonoCarroController.dispose();
    marcaCarroController.dispose();
    anoController.dispose();
    modeloController.dispose();
    descricaoProblemaController.dispose();
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
    dataEntradaController.clear();
    dataPrevisaoSaidaController.clear();
  }

  void initState() {
    super.initState();
    buscaListaMecanicos();
    buscaListaCliente();
  }

  Future<void> buscaListaMecanicos() async {
    try {
      final listaMecanicos = await MecanicoHttp.buscaListaMecanico();
      if (listaMecanicos != null) {
        setState(() {
          listaDeMecanicos = listaMecanicos;
        });
      }
    } catch (exception) {
      print("Erro ao buscar a lista de serviços: $exception");
    }
  }

  Future<void> buscaListaCliente() async {
    try {
      final listaClientes = await ClienteHttp.buscarListaCliente();
      if (listaClientes != null) {
        setState(() {
          listaDeClientes = listaClientes;
        });
      }
    } catch (exception) {
      print("Erro ao buscar a lista de clientes: $exception");
    }
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(0, 95, 95, 95),
                          border: Border.all(
                            color: Colors.orange,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: DropdownButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.orange),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                          dropdownColor: Color.fromARGB(255, 41, 41, 41),
                          value: selectedCliente,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCliente = newValue;
                              if (newValue != null) {
                                Cliente selectedClient =
                                    listaDeClientes.firstWhere(
                                        (cliente) => cliente.dono == newValue);
                                nomeDonoCarroController.text =
                                    selectedClient.dono;
                                cpfController.text = selectedClient.cpf;
                                telefoneController.text =
                                    selectedClient.telefone;
                                marcaCarroController.text =
                                    selectedClient.marca;
                                anoController.text =
                                    selectedClient.ano.toString();
                                modeloController.text = selectedClient.modelo;
                              }
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: null,
                              child: Text(
                                'Selecione um cliente',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            ...listaDeClientes.map<DropdownMenuItem<String>>(
                                (Cliente cliente) {
                              return DropdownMenuItem<String>(
                                value: cliente.dono,
                                child: Text(cliente.dono,
                                    style: TextStyle(color: Colors.orange)),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      if (selectedCliente != null)
                        Column(
                          children: [
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                labelStyle: TextStyle(color: Colors.orange),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                              ),
                              controller: cpfController,
                              enabled: false,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Telefone',
                                labelStyle: TextStyle(color: Colors.orange),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                              ),
                              controller: telefoneController,
                              enabled: false,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Marca do carro',
                                labelStyle: TextStyle(color: Colors.orange),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                              ),
                              controller: marcaCarroController,
                              enabled: false,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Modelo do carro',
                                labelStyle: TextStyle(color: Colors.orange),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                              ),
                              controller: modeloController,
                              enabled: false,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Ano do carro',
                                labelStyle: TextStyle(color: Colors.orange),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                              ),
                              controller: anoController,
                              enabled: false,
                            ),
                          ],
                        ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(0, 95, 95, 95),
                          border: Border.all(
                            color: Colors.orange,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: DropdownButton<String>(
                          value: selectedMecanico,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.orange),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMecanico = newValue!;
                            });
                          },
                          dropdownColor: Color.fromARGB(255, 41, 41, 41),
                          items: [
                            DropdownMenuItem<String>(
                              value: null,
                              child: Text("Selecione um mecânico"),
                            ),
                            ...listaDeMecanicos.map<DropdownMenuItem<String>>(
                              (Mecanico mecanico) {
                                return DropdownMenuItem<String>(
                                  value: mecanico.nome,
                                  child: Text(mecanico.nome),
                                );
                              },
                            ).toList(),
                          ],
                        ),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ],
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ],
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
                              selectedMecanico!,
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
