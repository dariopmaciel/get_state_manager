import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.toNamed('/basico');
                },
                child: const Text("Basico Reatividade")),
            TextButton(
                onPressed: () {
                  Get.toNamed('/localStateWidget');
                },
                child: const Text("Local State Widget")),
            TextButton(
                onPressed: () {
                  Get.toNamed('/workers');
                },
                child: const Text("Worker")),
            TextButton(
                onPressed: () {
                  Get.toNamed('/firstRebuild');
                },
                child: const Text('First Rebuild')),
          ],
        ),
      ),
    );
  }
}
