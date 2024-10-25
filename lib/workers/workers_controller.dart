import 'package:get/get.dart';

class WorkersController extends GetxController {
  final _workers = <Worker>[];

  final _nome = "dario".obs;
  //!criação do getter para não passar value e sim atraves de uma controllers

  String get nome => _nome.value;

//!bom para filtro de lista
  @override
  void onInit() {
    //*Primeiro Worker
    //!ele peca TUDOOO a cada segundo
    // final everWork = ever(
    //   _nome,
    //   (nome) {
    //     print('Executando o worker Ever');
    //     print(nome);
    //   },
    //   cancelOnError: true,
    //   condition: () => _nome.value == "dario",
    // );
    // _workers.add(everWork);
    // super.onInit();

    //*Segundo Worker
    //* Faz apenas 1x na primeira letra
    // final onceWorker = once<String>(_nome, (nome) {
    //   print('Executando o worker Once');
    //   print(nome);
    // });
    // _workers.add(onceWorker);
    // super.onInit();

    //*Terceiro Worker
    //*ignora todas as requisiçoes pelo TEMPO que foi determinado pelo usuario
    // final workerInterval = interval(
    //   _nome,
    //   (nome) {
    //     print(
    //         '########################### Worker Interval #######################');
    //     print('###########################$nome #######################');
    //   }, time: const Duration(seconds: 2) //time: 2.seconds
    // );
    // //para excluir sempre que sai da tela
    // _workers.add(workerInterval);
    // /super.onInit();

//*Quarto Worker DEBOUNCER
////!O melhor de todos!!!
//todo Ele espera alguns segundos eu terminar de digitar e então ele faz a busca!!!!!!!
//*(800milisegundos), possivel mudar com timer
    final workDebounce = debounce<String>(
      _nome,
      (nome) {
        print('################## Worker Debounce ####################');
        print('################## $nome ####################');
      },
    );
    _workers.add(workDebounce);
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
