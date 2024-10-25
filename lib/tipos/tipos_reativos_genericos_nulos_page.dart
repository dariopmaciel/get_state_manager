import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/tipos/model/aluno.dart';

class TiposReativosGenericosNuloPage extends StatelessWidget {
  //! >>>>>>>>>>>GENERICO NULO<<<<<<<<<<<<<<<<<<<<<<<<< Rxn = R. X. Nulable
  final nome = Rxn<String>('Dario');
  final isAluno = Rxn<bool>(true);
  final qtdCurso = Rxn<int>(1);
  final valorCurso = Rxn<double>(1250);
  final jornadas = Rxn<List<String>>(['Jornada Dart', 'Jornada Flutter']);
  final aluno = Rxn<Map<String, dynamic>>({
    'id': 0001,
    'nome': 'Dario',
    'nasc': 1984,
    'sexo': 'MASC',
  });
  final alunoModel = Rx<Aluno>(
    Aluno(
      id: 1999,
      nome: 'CAIO',
      email: "dariopmaciel@gmail",
      curso: 'Jornada ADF',
    ),
  );

  TiposReativosGenericosNuloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tipos Reativos Genericos NULOS Page',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //todo mundo dentro do mapa sera rebuildado
            // Obx(() => Text('Id do aluno ${aluno['id']}')),
            Obx(() {
              debugPrint('>>> Montando ID do aluno');
              //!>>>>>>>>>>>>>>> RECUPERAÇÃO DO GENERICO
              return Text('Id do aluno ${aluno.value?['id']}');
            }),
            //!>>>>>>>>>>>>>>> RECUPERAÇÃO DO GENERICO
            Obx(() => Text('Nome do aluno ${aluno.value?['nome']}')),

            Obx(() {
              debugPrint('>>> Montando ID do alunoModel');

              return Text('Id do aluno ${alunoModel.value.id}');
            }),

            Obx(() => Text('Nome do alunoModel ${alunoModel.value.nome}')),

            // Column(children: []), //!Não tem lista dentro pois o 'jornadas' já é uma lista
            //!>>>>>>>>>>>>>>> RECUPERAÇÃO DO GENERICO
            Obx(
              () => Column(
                children: jornadas.value?.map(Text.new).toList() ?? [],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                aluno.value?['id'] = 10;
                //! NECESSÁRIO REFRESH PARA ATUALIZAR
                aluno.refresh();
              },
              child: const Text("Alterar ID"),
            ),
            ElevatedButton(
              onPressed: () {
                // jornadas.add('Jornada Lógica');
                //!ZERA a LISTA e add o ultomo item 'Jornada Lógica'
                jornadas.value?.assign('Jornada Lógica');
                //! NECESSÁRIO REFRESH PARA ATUALIZAR
                jornadas.refresh();
              },
              child: const Text("Adicionar Jornada"),
            ),
            ElevatedButton(
              onPressed: () {
                // alunoModel.value = Aluno(
                //   id: 10,
                //   nome: 'VETOR',
                //   email: 'vetor@vilan.evil.com',
                //   curso: 'vilan',
                // );
                //!não precisa de refresh
                // alunoModel.refresh();

                //!ou usar calabel class
                alunoModel(Aluno(
                  id: 10,
                  nome: 'VETOR',
                  email: 'vetor@vilan.evil.com',
                  curso: 'vilan',
                ));
              },
              child: const Text('Alterar alunoModel'),
            ),
          ],
        ),
      ),
    );
  }
}
