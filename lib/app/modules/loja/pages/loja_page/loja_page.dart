import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/loja_cardapio_page.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';

class LojaPage extends StatefulWidget {
  final Loja loja;

  const LojaPage({
    Key key,
    @required this.loja,
  })  : assert(loja != null),
        super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(title: Text(widget.loja.uidLojista)),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Image.network(
              "https://instagram.frvd1-1.fna.fbcdn.net/v/t51.2885-15/e35/p1080x1080/90332272_201666294580965_3025175795829435882_n.jpg?_nc_ht=instagram.frvd1-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=XZb2UdjCekcAX-yCWdY&oh=51c11961af8ce0d58280081240366d26&oe=5EA5B687",
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  color: Colors.amber,
                  child: LojaCardapioPage(
                    uidLojista: widget.loja.uidLojista,
                  ),
                ),
                Container(
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
