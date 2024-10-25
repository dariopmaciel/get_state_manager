import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/atualiza%C3%A7%C3%A3o/usuario_model.dart';


class AtualizacaoObjetosPage extends StatelessWidget {
  final alunoModel = UsuarioModel(
    id: 1,
    nome: 'Dario',
    email: 'dariopmaciel@gmail.com',
  ).obs;
  AtualizacaoObjetosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualização'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(alunoModel.value.id.toString())),
            Obx(() => Text(alunoModel.value.nome)),
            Obx(() => Text(alunoModel.value.email)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  alunoModel.value.nome = "Guilherme";
                  alunoModel.refresh();
                },
                child: const Text("Atualizando COM REFRESH")),

            //!usando copyWith no 'usuarioModel'
            //!ATRIBUTO NO USUARIOmODEL não pode ser 'final'
            ElevatedButton(
                onPressed: () {
                  alunoModel.value =
                      alunoModel.value.copyWith(nome: 'Guilherme - CopyWith');
                },
                child: const Text("Atualizando COM COPYWITHopyWith")),

            //!usando copyWith no 'usuarioModelUPDATE do RX'

            ElevatedButton(
                onPressed: () {
                  alunoModel.update((val) {
                    val?.nome = 'Guilherme - COM UPDATE';
                  });
                },
                child: const Text("Atualizando COM UPDATE DO RX")),
          ],
        ),
      ),
    );
  }
}
