
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      body: Column(
        children: [
                    Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(16),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.orange, // Ícone de voltar laranja
              ),
              onPressed: () {
                Navigator.pop(context); // Voltar para a tela de login
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 36, // Tamanho maior do título
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3, // 30% da largura da tela
                  child: TextFormField(
                    controller: _nomeController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Nome',
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
                  // Lógica de cadastro aqui
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Cor laranja
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}