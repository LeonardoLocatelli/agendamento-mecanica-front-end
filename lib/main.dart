import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'RotasProjeto.dart';
import 'TelaCadastro.dart';
import 'TelaLogin.dart';

Future<void> main()  async {
    runApp(
       ProjetoAgendamento()
      );
}

class Controller extends GetxController {}

class ProjetoAgendamento extends StatefulWidget {
  const ProjetoAgendamento({Key? key}) : super(key: key);

  @override
  State<ProjetoAgendamento> createState() => _ProjetoAgendamentoState();
}

class _ProjetoAgendamentoState extends State<ProjetoAgendamento> {

  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RotasProjeto.INICIAL,
      getPages: [
        GetPage(name: RotasProjeto.INICIAL, page: () => TelaLogin()),
        GetPage(name: RotasProjeto.TELA_CADASTRO, page: () => TelaCadastro()),
      ],
      home: TelaLogin(),
    );
  }
}