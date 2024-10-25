import 'package:get/get.dart';

class GetxWidgetController extends GetxController {
  final _nome = 'Dario'.obs;

  String get nome => _nome.value;

  void alterarNome() {
    _nome('Guilherme');
  }
}
