
import 'package:agendamento_mecanica/http/servicoHttp.dart';
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

  List<String> estadosFiltro = ['Andamento', 'Concluido', 'TODOS'];
  String estadoFiltroSelecionado = 'TODOS';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Lista de serviços",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            DropdownButton<String>(
              value: estadoFiltroSelecionado,
              onChanged: (value) {
                setState(() {
                  estadoFiltroSelecionado = value!;
                });
              },
              items:
                  estadosFiltro.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
            Column()
          ],
        ),
      ),
      body: FoodItemList(servicos),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget MyCard(BuildContext context, {required Servico servico}) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      color: Color.fromARGB(88, 95, 95, 95),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.orange, width: 4)),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          title: Text(
            'Dono: ${servico.dono}',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Telefone: ${servico.telefone}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'CPF: ${servico.cpf}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Carro: ${servico.marca}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Modelo: ${servico.modelo}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Ano: ${servico.ano}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Problema: ${servico.problema}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Data de Entrada: ${servico.dataEntrada}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Previsão de Saída: ${servico.dataSaida}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Mecânico: ${servico.mecanico}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Mecânico: ${servico.situacao}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                (servico.situacao == "Concluido") ? SizedBox() : ElevatedButton(
                  onPressed: () {
                    concluirServico(context, servico);
                  },
                  child: Text("Atualizar Andamento"),
                ),
                
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: "Remover Serviço",
                onPressed: () async {
                  var retorno =
                      await cadastraServicoHttp.excluirServico(servico.id);
                  if (retorno == true) {
                      FlushBarComponente.mostrar(
                      context,
                      "Serviço excluido com sucesso",
                      Icons.check,
                      Colors.green,
                    );
                     buscaListaServicos();
                    atualizaListaServicos();
                  } else {
                    FlushBarComponente.mostrar(
                      context,
                      "Não foi possível excluir serviço",
                      Icons.close,
                      Color.fromARGB(255, 223, 12, 12),
                    );
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  concluirServico(BuildContext context, Servico servico) async {
    try {
      var retorno = await cadastraServicoHttp.alteraSituacaoServico(servico.id);
      if (retorno == true) {
        FlushBarComponente.mostrar(
          context,
          "Serviço concluído com sucesso",
          Icons.check,
          Colors.green,
        );
        buscaListaServicos();
        atualizaListaServicos();
      } else {
        FlushBarComponente.mostrar(
          context,
          "Erro ao concluir serviço",
          Icons.close,
          Color.fromARGB(255, 223, 12, 12),
        );
      }
    } catch (exception) {
      print("Erro ao concluir serviço: $exception");
    }
  }

  Widget FoodItemList(List<Servico> servicos) {
    List<Servico> servicosFiltrados;

    if (estadoFiltroSelecionado != 'TODOS') {
      servicosFiltrados = servicos
          .where((servico) => servico.situacao == estadoFiltroSelecionado)
          .toList();
    } else {
      servicosFiltrados = List.from(servicos);
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemCount: servicosFiltrados.length,
      itemBuilder: (context, index) {
        return MyCard(context, servico: servicosFiltrados[index]);
      },
    );
  }

  BottomNavBar() {
    return BottomAppBar(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add_alt_1),
            tooltip: "Cadastrar Clientes",
            onPressed: () {
              Get.toNamed(RotasProjeto.TELA_CADASTRO_CLIENTE);
            },
          ),
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
}
