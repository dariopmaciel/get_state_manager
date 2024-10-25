import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_state_manager/getx_widget/getx_widget_controller.dart';

class GetxWidgetPage extends StatelessWidget {
  const GetxWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Widget Page'),
      ),
      body: Center(
        child: GetX<GetxWidgetController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.nome),
                ElevatedButton(
                  onPressed: () => controller.alterarNome(),
                  child: const Text("Alterar Nome"),
                ),
              ],
            );
          },
          init: GetxWidgetController(),
        ),
      ),
    );
  }
}
