import 'package:get/get.dart';

class WorkersController extends GetxController {
  final _workers = <Worker>[];

  final _nome = "dario".obs;
  //!criação do getter para não passar value e sim atraves de uma controllers

  String get nome => _nome.value;

//!bom para filtro de lista
  @override
  void onInit() {
    final everWork = ever(
      _nome,
      (nome) {
        print('Executando o worker Ever');
        print(nome);
      },
      cancelOnError: true,
      condition: () => _nome.value == "dario",
    );
    _workers.add(everWork);
    super.onInit();
  }

  @override
  void onClose() {
    for (var worker in _workers) {
      // worker.dispose();
      worker;
    }
    super.onClose();
  }

  void alterarNome(String value) {
    _nome(value);
  }
}
