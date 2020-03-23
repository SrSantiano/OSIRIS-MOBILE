import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/widgets/item_loja.dart';

import 'loja_page_controller.dart';

class LojaPage extends StatefulWidget {
  final String title;
  const LojaPage({Key key, this.title = "Loja"}) : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (controller.lojas.hasError) {
            print("O erro é: " + controller.lojas.error.toString());
            return Center(
              child: RaisedButton(
                onPressed: controller.getLojas,
                child: Text('Error'),
              ),
            );
          }

          if (controller.lojas.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Loja> list = controller.lojas.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
            return ItemLoja(loja: list[index]);
            },
          );
        },
      ),
    );
  }
}
