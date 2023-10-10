import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'RotasProjeto.dart';
import 'TelaCadastro.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinhar o título no topo
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40), // Espaçamento entre o topo e o título
            Text(
              'Login',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 36, // Tamanho maior do título
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre o título e o campo de email
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3, // 30% da largura da tela
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.orange), // Texto do rótulo em laranja
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3, // 30% da largura da tela
                child: TextFormField(
                  controller: _senhaController,
                  style: TextStyle(color: Colors.white),
                  obscureText: !_senhaVisivel, // Altera a visibilidade da senha
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.orange), // Texto do rótulo em laranja
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _senhaVisivel = !_senhaVisivel;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica de login aqui
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Cor laranja
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                 Get.toNamed(RotasProjeto.TELA_CADASTRO);
              },
              child: Text(
                'Cadastrar',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}