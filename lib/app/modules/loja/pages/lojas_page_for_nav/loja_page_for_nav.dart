import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/lojas_page_for_nav/widgets/item_loja.dart';
import 'loja_page_for_nav_controller.dart';

class LojaPageForNav extends StatefulWidget {
  final String title;
  const LojaPageForNav({Key key, this.title = "Loja"}) : super(key: key);

  @override
  _LojaPageForNavState createState() => _LojaPageForNavState();
}

class _LojaPageForNavState
    extends ModularState<LojaPageForNav, LojaPageForNavController> {
  Stream<List<Loja>> streamLojas;

  @override
  void initState() {
    streamLojas = controller.repository.getLojas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Loja>>(
        stream: streamLojas,
        builder: (BuildContext context, AsyncSnapshot<List<Loja>> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView.builder(
                itemCount: snapshot.data.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return new ItemLoja(
                    loja: snapshot.data[index],
                  );
                },
              );
          }
        },
      ),
    );
  }
}
