import 'package:get/get.dart';

class GetBuilderController extends GetxController {
  var nome = "PatoBranco";
  int contador = 0;

  void alterarNome() {
    nome = 'Guilherme Silva';
    //!depois que se chama o 'alterar nome se chama o metodo abaixo'
    update(['nome']);
  }

  void increment() {
    contador++;
    //!definição de ITEM a ser buildado!!!
    update(['contador']);
  }
}
