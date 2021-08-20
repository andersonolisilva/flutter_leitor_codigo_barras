import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitor_codigo_barras/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    Get.put(HomePageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarCode Scanner"),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor do código de barras',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            GetBuilder<HomePageController>(builder: (controller) {
              return Text(
                controller.valorCodigoBarras,
                style: Theme.of(context).textTheme.headline5,
              );
            }),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
                onPressed: () {
                  Get.find<HomePageController>().scanearCodigoBarras();
                },
                icon: Image.asset(
                  'assets/codigo_barras.png',
                  width: 50,
                ),
                label: Text(
                  'Ler código de barras',
                  style: Theme.of(context).textTheme.headline6,
                ))
          ],
        ),
      ),
    );
  }
}
