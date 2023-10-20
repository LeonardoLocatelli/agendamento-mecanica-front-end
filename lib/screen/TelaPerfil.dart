import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/avatar.png'),
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
            SizedBox(height: 10),
            Text(
              'Cidade: ',
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
