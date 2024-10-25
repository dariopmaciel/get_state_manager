import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalStateWidget extends StatelessWidget {
  const LocalStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local State Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextFormField(
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     suffixIcon: IconButton(
            //       icon: const Icon(Icons.remove_red_eye_outlined),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),

            ValueBuilder<bool?>(
              initialValue: true,
              builder: (obscureValue, updater) {
                return TextFormField(
                  obscureText: obscureValue!,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        updater(!obscureValue);
                      },
                    ),
                  ),
                );
              },
              onUpdate: (p0) {
                print('Alterado para $p0');
              },
              onDispose: () {
                print('Removido da arvore de widget');
              },
            ),
            ObxValue<RxBool>((obscureData) {
              return TextFormField(
                obscureText: obscureData.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      obscureData.toggle();
                    },
                  ),
                ),
              );
            }, true.obs)
          ],
        ),
      ),
    );
  }
}
