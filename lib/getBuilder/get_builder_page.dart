import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/getBuilder/get_builder_controller.dart';

class GetBuilderPage extends StatelessWidget {
  const GetBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Builder Page'),
      ),
      body: Center(
        child: GetBuilder<GetBuilderController>(builder: (controller) {
          debugPrint('################ GetBuild Geral ####################');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(controller.nome),
              GetBuilder<GetBuilderController>(
                id: 'nome',
                builder: (controller) {
                  debugPrint('################ GET BUILDER Nome ####################');
                      return Text(controller.nome);
                },
              ),

              // Text(controller.contador.toString()),
              GetBuilder<GetBuilderController>(
                //!uma vez definido o ID eu posso buildar somente uma parte do código
                id: 'contador',
                builder: (controller) {
                  debugPrint('################ GET BUILDER Contador ####################');
                  return Text(controller.contador.toString());
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.alterarNome();
                  },
                  child: const Text("Alterar")),

              ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: const Text("Incremento")),

              ElevatedButton(
                  onPressed: () {
                    controller.alterarNome();
                    controller.increment();
                  },
                  child: const Text("AMBOS")),
            ],
          );
        }),
      ),
    );
  }
}
