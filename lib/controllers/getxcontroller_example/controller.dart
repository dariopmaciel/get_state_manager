import 'package:get/get.dart';

class Controller extends GetxController {
  //* aqui podem ficar CONCENTRADOS as variaveis observadas
  // Devido a 'nome' ser um RXString, recuperação via 'Get.find<Controller>().nome.value'
  final _nome = 'dario'.obs;

  //!sempre disponibize 
  String get nome => _nome.value;

  //!metodo que será Executado a controller for iniciada
  @override
  Future<void> onInit() async {
    //! NÃAAO DELEQUE ITENS DE TELA PARA A CONTROLLER
    //!Lembrete* Nunca!!! Colocar TextEditingController, GlobalKeys, Animated (coisas da tela, ciclo de vida)- Dentro da Controller.
    //*Lembrete* Nunca!!! Colocar TextEditingController, GlobalKeys, Animated (coisas da tela, ciclo de vida)- Dentro da Controller.
    //TODO Lembrete* Nunca!!! Colocar TextEditingController, GlobalKeys, Animated (coisas da tela, ciclo de vida)- Dentro da Controller.
    // await 2.seconds.delay() ;// igual a   // const Duration(seconds: 2);
    print('=>>>onInit');
    super.onInit();
  }

  //!metodo que será executado quando a 'TELA' for executada
  @override
  void onReady() {
    print('=>>>onReady');
    super.onReady();
  }

  //!metodo quando nossa 'TELA' for feita o dispose!!!
  @override
  void onClose() {
    print('=>>>onClose');
    super.onClose();
  }

  //! desta forma os metodos podem ficar centralizados e carregados SOMENTE quando necessários
  void alterarDados() {
    _nome("Jacó");
  }
}
