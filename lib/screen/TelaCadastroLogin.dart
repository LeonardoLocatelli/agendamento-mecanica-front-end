import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../RotasProjeto.dart';
import '../componente/FlushBarComponente.dart';
import '../http/adicionarLogin.dart';

class TelaCadastroLogin extends StatefulWidget {
  @override
  _TelaCadastroLoginState createState() => _TelaCadastroLoginState();
}


class _TelaCadastroLoginState extends State<TelaCadastroLogin> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  limpaCampos(){
  _nomeController.clear();
  _emailController.clear();
  _senhaController.clear();
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
            Get.toNamed(RotasProjeto.TELA_LOGIN);
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
          child: Material(
            borderRadius: BorderRadiusDirectional.circular(5),
            elevation: 5,
            color: Color.fromARGB(88, 95, 95, 95),
            child: Container(
              margin: EdgeInsets.all(20),
              width: 600,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Cadastro',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 36,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      controller: _nomeController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      controller: _senhaController,
                      style: TextStyle(color: Colors.white),
                      obscureText: !_senhaVisivel,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.orange),
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
                  ElevatedButton(
                    onPressed: () async {
                      var retorno = await AdicionarLoginHttp.adicionaLogin(
                          _nomeController.text,
                          _emailController.text,
                          _senhaController.text);
                      if (retorno == true) {
                        FlushBarComponente.mostrar(
                            context,
                            "Cadastrado com sucesso!",
                            Icons.check,
                            Color.fromARGB(255, 64, 223, 15));
                            limpaCampos();
                      } else {
                        FlushBarComponente.mostrar(
                            context,
                            "Não foi possivel realizar o Cadastro!",
                            Icons.close,
                            Color.fromARGB(255, 223, 12, 12));
                      }
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
