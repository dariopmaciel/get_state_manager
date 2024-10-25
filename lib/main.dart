import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/atualiza%C3%A7%C3%A3o/atualizacao_objetos_page.dart';
import 'package:get_state_manager/basico/reatividade_page.dart';
import 'package:get_state_manager/controllers/controllers_home_page.dart';
import 'package:get_state_manager/controllers/getxcontroller_example/controller.dart';
import 'package:get_state_manager/controllers/getxcontroller_example/getx_controller_example_page.dart';
import 'package:get_state_manager/firstRebuild/first_rebuild_page.dart';
import 'package:get_state_manager/getBuilder/get_builder_controller.dart';
import 'package:get_state_manager/getBuilder/get_builder_page.dart';
import 'package:get_state_manager/getx_widget/getx_widget_controller.dart';
import 'package:get_state_manager/getx_widget/getx_widget_page.dart';
import 'package:get_state_manager/home_page.dart';
import 'package:get_state_manager/local_state_widget/local_state_widget.dart';
import 'package:get_state_manager/tipos/tipos_obs_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_nulos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_page.dart';
import 'package:get_state_manager/workers/workers_controller.dart';

import 'package:get_state_manager/workers/workers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/atualizacao', page: () => AtualizacaoObjetosPage()),
        GetPage(name: '/basico', page: () => ReatividadePage()),
        GetPage(
            name: '/localStateWidget', page: () => const LocalStateWidget()),
        GetPage(
            name: '/workers',
            page: () => WorkersPage(),
            binding: BindingsBuilder.put(() => WorkersController())),
        GetPage(name: '/firstRebuild', page: () => const FirstRebuildPage()),
        GetPage(
            name: '/controllers',
            page: () => const ControllersHomePage(),
            children: [
              GetPage(
                  name: '/getxcontroller',
                  //!atenção: se usar este de baixo não estará 100% ligada a CONTROLLER
                  //!vai ser inicializado SOMENTE quando for chamado pela PRIMEIRA vez
                  //! e altera o ciclo de vida => Comentar o item 'Obx(() => Text(Get.find<Controller>().nome.value)),' do getx_controller_example_page
                  // binding: BindingsBuilder(() {
                  //   Get.lazyPut(() => Controller());
                  // }),
                  //*correto
                  //para fazer um reload não se pode usar PUT pois ele instancia na hora, por isto usar lazyput
                  // binding: BindingsBuilder.put(() => Controller()),
                  binding:
                      BindingsBuilder(() => Get.lazyPut(() => Controller())),
                  page: () => const GetxControllerExamplePage()),
            ]),
        GetPage(name: '/tiposReativos', page: () => TiposReativosPage()),
        GetPage(
            name: '/tiposReativosGenericos',
            page: () => TiposReativosGenericosPage()),
        GetPage(
            name: '/tiposReativosGenericosNulos',
            page: () => TiposReativosGenericosNuloPage()),
        GetPage(name: '/tiposObs', page: () => TiposObsPage()),
        GetPage(
            name: '/getxWidget',
            page: () => const GetxWidgetPage(),
            //!Caso remover do init da pagina, deve-se traser ele para ca
            binding: BindingsBuilder.put(() => GetxWidgetController())),
        GetPage(
          name: '/get_builder',
          page: () => const GetBuilderPage(),
          binding: BindingsBuilder.put(() => GetBuilderController()),
        ),
      ],
    );
  }
}
