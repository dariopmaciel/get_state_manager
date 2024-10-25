import 'package:flutter/material.dart';

class ReatividadePage extends StatelessWidget {
  const ReatividadePage({super.key});

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
            const Text('1'),
            ElevatedButton(onPressed: () {}, child: const Text('Soma 1')),
          ],
        ),
      ),
    );
  }
}
