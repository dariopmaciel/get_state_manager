import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/controllers/getxcontroller_example/controller.dart';

class GetxControllerExamplePage extends StatefulWidget {
  const GetxControllerExamplePage({super.key});

  @override
  State<GetxControllerExamplePage> createState() =>
      _GetxControllerExamplePageState();
}

class _GetxControllerExamplePageState extends State<GetxControllerExamplePage> {
  @override
  void dispose() {
    print('Dispose GetxControllerExamplePage');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build GetxControllerExamplePage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!SEMPRE deve se privar o value, sendo mantido no get da controller
            // Obx(() => Text(Get.find<Controller>().nome.value)),
            Obx(() => Text(Get.find<Controller>().nome)),
            ElevatedButton(
              onPressed: () {
                Get.find<Controller>().alterarDados();
              },
              child: const Text("Alterar"),
            ),

            ElevatedButton(
              onPressed: () {
                Get.reload<Controller>();
                //!é necessário atualizar a tela, por isto o 'setState' mas é necessário o LAZYPUT
                setState(() {});
              },
              child: const Text("Recarregar Controller-Reload de objetos"),
            ),
          ],
        ),
      ),
    );
  }
}
