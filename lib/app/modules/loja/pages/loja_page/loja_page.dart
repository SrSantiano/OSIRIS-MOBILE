import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/loja_cardapio_page.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';
import 'package:osiris/app/modules/loja/pages/loja_produto/loja_produto_widget.dart';
import 'package:osiris/app/utils/extension_color.dart';

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
  String url =
      "https://instagram.frvd1-1.fna.fbcdn.net/v/t51.2885-15/e35/p1080x1080/90332272_201666294580965_3025175795829435882_n.jpg?_nc_ht=instagram.frvd1-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=XZb2UdjCekcAX-yCWdY&oh=51c11961af8ce0d58280081240366d26&oe=5EA5B687";
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return WillPopScope(
          onWillPop: controller.onBackPressed,
          child: Scaffold(
            backgroundColor: Colors.blue,
             appBar: AppBar(
              title: AutoSizeText(
                widget.loja.nomeFantasia.toUpperCase(),
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                  color: Color(
                    widget.loja.tema.corTextoPrimario.toHexFlutterColor(),
                  ),
                ),
                textAlign: TextAlign.right,
                minFontSize: 16,
                maxFontSize: 16,
              ),
              centerTitle: true,
              elevation: 5,
              backgroundColor: Color(
                widget.loja.tema.corPrimaria.toHexFlutterColor(),
              ),
            ), 
            body: Column(
              children: <Widget>[
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: CachedNetworkImage(
                    imageUrl: controller.produtoUnidade == null
                        ? widget.loja.publicacaoImagemInicial
                        : controller.produtoUnidade.imagem,
                    fit: BoxFit.cover,
                    //height: double.infinity,
                    alignment: Alignment.center,
                    width: double.infinity,
                    useOldImageOnUrlChange: true,
                  ),
                ),
                Flexible(
                  flex: 6,
                  fit: FlexFit.tight,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(
                        color: Colors.amber,
                        child: LojaCardapioPage(
                          loja: widget.loja
                        ),
                      ),
                      Container(
                        color: Colors.pink,
                        child: LojaProdutoWidget(
                          controller.produtoUnidade,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
