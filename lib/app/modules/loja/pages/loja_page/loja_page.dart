import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/loja_cardapio_page.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';

class LojaPage extends StatefulWidget {
  final String title;
  final Loja loja;

  LojaPage({Key key, this.title = "LojaPage", @required this.loja})
      : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text(widget.loja.uidLojista)),
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
                  color: Colors.purple,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Container(
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Hero(
                                  tag:
                                      '${widget.loja.nomeFantasia}${widget.loja.uidLojista}__heroTag',
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.loja.imagemPerfil,
                                      fit: BoxFit.cover,
                                      useOldImageOnUrlChange: true,
                                    ),
                                  ),
                                  transitionOnUserGestures: true,
                                  placeholderBuilder: (context, size, widget) {
                                    return Opacity(opacity: 0.2, child: widget);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Container(color: Colors.transparent),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            maxChildSize: 0.620,
            minChildSize: 0.45,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                child: LojaCardapioPage(
                  uidLojista: widget.loja.uidLojista,
                  scrollController: scrollController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
