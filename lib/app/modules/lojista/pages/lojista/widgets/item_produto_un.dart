import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../model/produto_alimento_un.dart';

class ItemProdutoUn extends StatelessWidget {
  final ProdutoAlimentoUn produtoUnidade;
  final Function onPressed;

  const ItemProdutoUn({
    Key key,
    @required this.produtoUnidade,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              //color: Colors.white,
              height: 175,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: double.infinity,
                      child: Hero(
                        tag: '${produtoUnidade.idProduto}__herotag',
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: produtoUnidade.imagem,
                            fit: BoxFit.cover,
                            useOldImageOnUrlChange: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${produtoUnidade.nome}'.toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                              letterSpacing: 0,
                              color: Color(
                                0xff000000,
                              ),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            produtoUnidade.getIngredientes(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              height: 1.3,
                              color: Color(
                                0xff000000,
                              ),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                'R\$ ',
                                style: GoogleFonts.bitter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    color: Colors.black87),
                              ),
                              Text(
                                '${produtoUnidade.preco.toStringAsFixed(2)}',
                                style: GoogleFonts.bitter(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0,
                                    color: Colors.deepOrange),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(right: BorderSide(width: 3, color: Colors.purple)),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              height: 175,
              width: double.infinity,
              child: RawMaterialButton(
                splashColor: Color(0x90FFD54F),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
