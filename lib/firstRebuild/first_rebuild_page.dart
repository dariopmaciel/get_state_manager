import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstRebuildPage extends StatefulWidget {
  const FirstRebuildPage({super.key});

  @override
  State<FirstRebuildPage> createState() => _FirstRebuildPageState();
}

class _FirstRebuildPageState extends State<FirstRebuildPage> {
  final isAluno = false.obs;




//!faz o primeiro rebuild como esta determinado e mostra!
// para remover este comportamento firstRebuild = false
//então n~çao mostra o primeiro comportamento falso
  @override
  void initState() {
    super.initState();
    // isAluno.firstRebuild = false;
    //! worker Ever
    ever(
      isAluno,
      (isAluno) {
        Get.snackbar("EVER", 'O aluno é: $isAluno');
      },
    );
  }

  @override
  void dispose() {
    isAluno.firstRebuild;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Rebuild'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Switch(value: isAluno.value, onChanged: (value) {})),
            ElevatedButton(
                onPressed: () {
                  isAluno(true);
                },
                child: const Text('Set True')),
            ElevatedButton(
                onPressed: () {
                  isAluno(false);
                },
                child: const Text('Set False')),
          ],
        ),
      ),
    );
  }
}
