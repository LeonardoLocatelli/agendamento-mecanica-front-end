import 'package:agendamento_mecanica/http/adicionarLogin.dart';
import 'package:agendamento_mecanica/http/clienteHttp.dart';
import 'package:agendamento_mecanica/http/mecanicoHttp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';
import '../model/Cliente.dart';
import '../model/Mecanico.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  bool mostrarListaDeMecanicos = false;
  bool mostrarListaDeClientes = false;
  List<Mecanico> listaDeMecanicos = [];
  List<Cliente> listaDeClientes = [];
  String email = "";
  String nome = "";

  @override
  void initState() {
    super.initState();
    buscaListaMecanicos();
    buscaListaDeClientes();
    buscaPerfilMecanica();
  }

  buscaPerfilMecanica() async {
    try {
      var retorno = await AdicionarLoginHttp.buscaPerfilMecanica();
      if (retorno != null) {
        setState(() {
          email = retorno.email;
          nome = retorno.nome;
        });
      }
    } catch (exception) {
      print("Erro ao buscar informaçoes do perfil da mecanica: $exception");
    }
  }

  atualizaListaMecanicos() {
    buscaListaMecanicos();
  }

  atualizaListaClientes() {
    buscaListaDeClientes();
  }

  Future<void> buscaListaDeClientes() async {
    try {
      final listaClientes = await ClienteHttp.buscarListaCliente();
      if (listaClientes != null) {
        setState(() {
          listaDeClientes = listaClientes;
        });
      }
    } catch (exception) {
      print("Erro ao buscar a lista de serviços: $exception");
    }
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: IconButton(
                          tooltip: "Deslogar",
                            onPressed: () {
                              Get.toNamed(RotasProjeto.TELA_LOGIN);
                            },
                            icon: Icon(Icons.login_outlined,
                                color: Colors.orange, size: 30)),
                      )
                    ],
                  ),
                  Text(
                    "Mecanica: $nome",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Email: $email",
                    style: TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                  SizedBox(height: 20),
                  if (mostrarListaDeMecanicos) ListaDeMecanicos(context),
                  if (mostrarListaDeClientes) ListaDeClientes(context)
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
                SizedBox(width: 16),
                FloatingActionButton(
                  tooltip: 'Mostrar Lista de Clientes',
                  onPressed: () {
                    setState(() {
                      mostrarListaDeClientes = !mostrarListaDeClientes;
                    });
                  },
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person_search, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ListaDeMecanicos(BuildContext context) {
    return Column(
      children: [
        Text(
          "Lista de Mecanicos",
          style: TextStyle(
            fontSize: 25,
            color: Colors.orange,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome: ${mecanico.nome}",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Telefone: ${mecanico.telefone ?? 'Não informado'}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "CPF: ${mecanico.cpf ?? 'Não informado'}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Salário: ${mecanico.salario?.toString() ?? 'Não informado'}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () async {
                          var retorno =
                              await MecanicoHttp.excluirMecanico(mecanico.nome);
                          if (retorno == true) {
                            FlushBarComponente.mostrar(
                              context,
                              "Mecanico excluido com sucesso!",
                              Icons.check,
                              Color.fromARGB(255, 64, 223, 15),
                            );
                            atualizaListaMecanicos();
                          } else {
                            FlushBarComponente.mostrar(
                                context,
                                "Não foi possivel excluir mecanico",
                                Icons.close,
                                Color.fromARGB(255, 223, 12, 12));
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
    );
  }

  Widget ListaDeClientes(BuildContext context) {
    return Column(
      children: [
        Text(
          "Lista de Clientes",
          style: TextStyle(
            fontSize: 25,
            color: Colors.orange,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: Color.fromARGB(88, 95, 95, 95),
            border: Border.all(color: Colors.orange, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: listaDeClientes.length,
            itemBuilder: (context, index) {
              final cliente = listaDeClientes[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 139, 139, 139),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dono: ${cliente.dono}",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Telefone: ${cliente.telefone ?? 'Não informado'}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "CPF: ${cliente.cpf ?? 'Não informado'}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Marca: ${cliente.marca}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Ano: ${cliente.ano}",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Modelo: ${cliente.modelo}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () async {
                          var retorno =
                              await ClienteHttp.excluirCliente(cliente.id);
                          if (retorno == true) {
                            FlushBarComponente.mostrar(
                              context,
                              "Cliente excluido com sucesso!",
                              Icons.check,
                              Color.fromARGB(255, 64, 223, 15),
                            );
                            atualizaListaClientes();
                          } else {
                            FlushBarComponente.mostrar(
                                context,
                                "Não foi possivel excluir cliente",
                                Icons.close,
                                Color.fromARGB(255, 223, 12, 12));
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
    );
  }
}
