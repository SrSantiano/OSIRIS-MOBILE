import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/loja/pages/lojas_page_for_nav/widgets/item_loja_listview.dart';

import 'loja_page_for_nav_controller.dart';
class LojaPageForNav extends StatefulWidget {
  final String title;
  const LojaPageForNav({Key key, this.title = "Loja"}) : super(key: key);

  @override
  _LojaPageForNavState createState() => _LojaPageForNavState();
}

class _LojaPageForNavState extends ModularState<LojaPageForNav, LojaPageForNavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ItemLojaListView(
        streamLojas: controller.getLojasStream(),
      ),
    );
  }
}
