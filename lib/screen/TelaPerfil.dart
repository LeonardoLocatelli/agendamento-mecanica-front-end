import 'package:agendamento_mecanica/http/mecanicoHttp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';
import '../model/Mecanico.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  bool mostrarListaDeMecanicos = false;
  List<Mecanico> listaDeMecanicos = [];

  @override
  void initState() {
    super.initState();
    buscaListaMecanicos();
  }

  atualizaListaMecanicos() {
    setState(() {
      listaDeMecanicos;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu Perfil',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed(RotasProjeto.TELA_INICIAL);
          },
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Leonardo Locatelli',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Endereço de Email: ',
                    style: TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                  SizedBox(height: 20),
                  if (mostrarListaDeMecanicos)
                    Column(
                      children: [
                        Text(
                          "Lista de Mecanicos",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.orange,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(88, 95, 95, 95),
                            border: Border.all(color: Colors.orange, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            itemCount: listaDeMecanicos.length,
                            itemBuilder: (context, index) {
                              final mecanico = listaDeMecanicos[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 139, 139, 139),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nome: ${mecanico.nome}",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Telefone: ${mecanico.telefone ?? 'Não informado'}",
                                          style:
                                              TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "CPF: ${mecanico.cpf ?? 'Não informado'}",
                                          style:
                                              TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "Salário: ${mecanico.salario?.toString() ?? 'Não informado'}",
                                          style:
                                              TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          var retorno = await MecanicoHttp
                                              .excluirMecanico(mecanico.nome);
                                          if (retorno == true) {
                                            FlushBarComponente.mostrar(
                                                context,
                                                "Mecanico adicionado com sucesso!",
                                                Icons.close,
                                                Color.fromARGB(
                                                    255, 223, 12, 12));
                                            atualizaListaMecanicos();
                                          } else {
                                            FlushBarComponente.mostrar(
                                                context,
                                                "Não foi possivel excluir mecanico",
                                                Icons.close,
                                                Color.fromARGB(
                                                    255, 223, 12, 12));
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              children: [
                FloatingActionButton(
                  tooltip: 'Cadastrar Mecânico',
                  onPressed: () {
                    Get.toNamed(RotasProjeto.TELA_CADASTRO_MECANICO);
                  },
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.add, color: Colors.black),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  tooltip: 'Mostrar Lista de Mecânicos',
                  onPressed: () {
                    setState(() {
                      mostrarListaDeMecanicos = !mostrarListaDeMecanicos;
                    });
                  },
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.list, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
