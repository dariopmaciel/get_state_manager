import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReatividadePage extends StatelessWidget {
  //criação de variavel reativa
  final _counter = 0.obs;

  ReatividadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basico Reatividade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter:'),
            Obx(() => Text('${_counter.value}')),
            ElevatedButton(
              onPressed: () {
                _counter.value++;
              },
              child: const Text('Soma 1'),
            ),
          ],
        ),
      ),
    );
  }
}
