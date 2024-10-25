import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/basico/reatividade_page.dart';
import 'package:get_state_manager/home_page.dart';

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
        primaryColor: Colors.blue,
        useMaterial3: false,
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/basico', page: () => const ReatividadePage()),
      ],
    );
  }
}
