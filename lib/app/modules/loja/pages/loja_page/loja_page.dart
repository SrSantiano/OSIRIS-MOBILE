import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/loja_cardapio_page.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_controller.dart';

class LojaPage extends StatefulWidget {
  final String title;
  LojaPage({Key key, this.title = "LojaPage"}) : super(key: key);

  final LojaRepositoryController lojaRepositoryController = Modular.get();

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar:
          AppBar(title: Text(widget.lojaRepositoryController.uidLojista)),
      body: Scaffold(
        backgroundColor: Colors.amber,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(
                  flex: 5,
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
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.45,
              maxChildSize: 0.620,
              minChildSize: 0.45,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return LojaCardapioPage(
                  scrollController: scrollController,
                );
              },
            ),
          ],
        ),
      ),
    );
    /* Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 5,
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
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            maxChildSize: 0.620,
            minChildSize: 0.45,
            builder: (BuildContext context, ScrollController scrollController) {
              return  Cardapio(
                streamCardapio: controller.getCardapio('H57Og4Egu5vUBhMxKptq'),
                scrollController: scrollController,
              ); 
               /* Container(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
              );  */
            },
          ),
        ],
      ),
    ); */
  }
}
