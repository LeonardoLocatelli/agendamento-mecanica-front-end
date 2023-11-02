import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarComponente {
  static mostrar(
      context, String mensagem, IconData nomeIcone, Color corBackground,
      {Color letraColor = Colors.white, int duration = 2}) {
    return Flushbar(
      backgroundColor: corBackground,
      message: mensagem,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: duration),
      icon: Icon(
        nomeIcone,
        color: letraColor,
        size: 30,
      ),
      shouldIconPulse: true,
      borderRadius: BorderRadius.circular(12),
      messageColor: letraColor,
      padding: EdgeInsets.all(20),
      messageSize: 16,
      margin: EdgeInsets.fromLTRB(
          5, 5, MediaQuery.of(context).size.width * 0.70, 0)
    ).show(context);
  }
}