import 'dart:js';

import 'package:agendamento_mecanica/http/servicoHttp.dart';
import 'package:agendamento_mecanica/screen/TelaLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';
import '../model/Servico.dart';

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  List<Servico> servicos = [];

  @override
  void initState() {
    super.initState();
    buscaListaServicos();
  }

  atualizaListaServicos() {
    setState(() {
      servicos;
    });
  }

  Future<void> buscaListaServicos() async {
    try {
      final listaServicos = await cadastraServicoHttp.buscaListaServico();
      if (listaServicos != null) {
        setState(() {
          servicos = listaServicos;
        });
      }
    } catch (exception) {
      print("Erro ao buscar a lista de serviços: $exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: Text(
          "Lista de serviços",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
          ),
        ),
      ),
      body: FoodItemList(servicos),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

FoodItemList(List<Servico> servicos) {
  return FutureBuilder<List<Servico>>(
    future: cadastraServicoHttp.buscaListaServico(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Erro: ${snapshot.error}'));
      } else {
        final servicos = snapshot.data;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: servicos?.length,
          itemBuilder: (context, index) {
            return MyCard(context, servico: servicos![index]);
          },
        );
      }
    },
  );
}

BottomNavBar() {
  return BottomAppBar(
    color: Colors.orange,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // IconButton(
        //   icon: Icon(Icons.add_reaction),
        //   onPressed: () {},
        // ),
        IconButton(
          icon: Icon(Icons.add),
          tooltip: "Cadastrar Servico",
          onPressed: () {
            Get.toNamed(RotasProjeto.TELA_CADASTRO_SERVICO);
          },
        ),
        IconButton(
          icon: Icon(Icons.person),
          tooltip: "Perfil",
          onPressed: () {
            Get.toNamed(RotasProjeto.TELA_PERFIL);
          },
        ),
      ],
    ),
  );
}

Widget MyCard(BuildContext context, {required Servico servico}) {
  return Card(
    margin: EdgeInsets.all(4),
    elevation: 5,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.10,
      color: Color.fromARGB(255, 151, 151, 151),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/car_image.jpg',
              width: 100,
              height: 100,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Nome do Dono: ${servico.dono}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Carro: ${servico.marca}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Ano: ${servico.ano}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Modelo: ${servico.modelo}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Problema: ${servico.problema}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Data de Entrada: ${servico.dataEntrada}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Previsão de Saída: ${servico.dataSaida}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Mecânico Encarregado: ${servico.mecanico}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              var retorno =
                  await cadastraServicoHttp.excluirServico(servico.id);
              if (retorno == true) {
                
              } else {
                FlushBarComponente.mostrar(
                    context,
                    "Não foi possivel excluir serviço",
                    Icons.close,
                    Color.fromARGB(255, 223, 12, 12));
              }
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    ),
  );
}
