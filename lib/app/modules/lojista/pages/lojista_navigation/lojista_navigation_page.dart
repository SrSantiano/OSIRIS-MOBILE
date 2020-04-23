import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../model/loja.dart';

import 'lojista_navigation_controller.dart';
import 'widgets/item_lojista.dart';

class LojistaNavigationPage extends StatefulWidget {
  @override
  _LojistaPageState createState() => _LojistaPageState();
}

class _LojistaPageState
    extends ModularState<LojistaNavigationPage, LojistaNavigationController> {
  Stream<List<Loja>> _lojas;

  @override
  void initState() {
    _lojas = controller.repository.getLojas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lojista'),
      ),
      body: StreamBuilder<List<Loja>>(
        stream: _lojas,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemLojista(
                key: Key(snapshot.data[index].uidLojista),
                loja: snapshot.data[index],
                onPressed: () {
                  Modular.to
                      .pushNamed('/lojista', arguments: snapshot.data[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
