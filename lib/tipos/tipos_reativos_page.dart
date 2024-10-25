import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiposReativosPage extends StatelessWidget {
  // IGUAL A // final nome = 'Dario'.obs;
  final nome = RxString('Dario');

  // IGUAL A // final isAluno = true.obs;
  final isAluno = RxBool(true);

  // IGUAL A // final qtdCurso = 1.obs;
  final qtdCurso = RxInt(1);

  // IGUAL A // final valorCurso = 1250.obs;
  final valorCurso = RxDouble(1250);

  // IGUAL A // final jornadas = [
  //   'Jornada Dart',
  //   'Jornada Flutter',
  //   'Jornada GetX',
  //   'Jornada BackEnd',
  // ].obs;
  final jornadas = RxList([
    'Jornada Dart',
    'Jornada Flutter',
    'Jornada GetX',
    'Jornada BackEnd',
  ]);

  // IGUAL A //final aluno = {
  //   'id': 0001,
  //   'nasc': 1984,
  //   'nome': 'Dario',
  //   'sexo': 'MASC',
  // }.obs;
  final aluno = RxMap({
    'id': 0001,
    'nome': 'Dario',
    'nasc': 1984,
    'sexo': 'MASC',
  });

  TiposReativosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos Reativos Page (Primitivos)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //todo mundo dentro do mapa sera rebuildado
            // Obx(() => Text('Id do aluno ${aluno['id']}')),
            Obx(() {
              debugPrint('>>> Montando ID do aluno');
              return Text('Id do aluno ${aluno['id']}');
            }),
            Text('Nome do aluno ${aluno['nome']}'),
            // Column(children: []), //!Não tem lista dentro pois o 'jornadas' já é uma lista
            Obx(() => Column(children: jornadas.map(Text.new).toList())),
            ElevatedButton(
              onPressed: () {
                aluno['id'] = 10;
              },
              child: const Text("Alterar ID"),
            ),
            ElevatedButton(
              onPressed: () {
                jornadas.add('Jornada Lógica');
              },
              child: const Text("Adicionar Jornada .ADD"),
            ),
            ElevatedButton(
              onPressed: () {
                jornadas.assign(
                    'Jornada Lógica'); //!ZERA a LISTA e add o ultomo item 'Jornada Lógica'
              },
              child: const Text("Adicionar Jornada .ASSING"),
            ),
          ],
        ),
      ),
    );
  }
}
