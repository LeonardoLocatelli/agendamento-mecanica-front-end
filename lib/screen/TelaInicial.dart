import 'package:agendamento_mecanica/http/servicoHttp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../model/Servico.dart';

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
      body: FoodItemList(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

FoodItemList() {
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
            return MyCard(servico: servicos![index]);
          },
        );
      }
    },
  );
}


BottomNavBar() {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add_reaction),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(RotasProjeto.TELA_CADASTRO_SERVICO);
          },
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Get.toNamed(RotasProjeto.TELA_PERFIL);
          },
        ),
      ],
    ),
  );
}

MyCard({required Servico servico}) {
  return Card(
    margin: EdgeInsets.all(4),
    elevation: 5,
    child: Container(
      color: Colors.white,
      width: 600,
      height: 800,
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
                  'Data de Entrada: ${servico.dataEntrada}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Nome do Carro: ${servico.nomeCarro}',
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
                  'Nome do Dono: ${servico.nomeDono}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Descrição do Problema: ${servico.descricaoProblema}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Data de Previsão de Saída: ${servico.dataPrevisaoSaida}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Mecânico Encarregado: ${servico.mecanicoEncarregado}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
