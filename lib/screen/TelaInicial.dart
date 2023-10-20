
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';


class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Lista de serviços",style: TextStyle(
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

class FoodItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text("Item $index"),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add_reaction),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {

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
}