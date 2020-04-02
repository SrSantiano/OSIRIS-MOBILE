import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';

class ItemProdutoUn extends StatelessWidget {
  final ProdutoUnidade produtoUnidade;

  const ItemProdutoUn({Key key, @required this.produtoUnidade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff8a795d),
              blurRadius: 20.0,
              spreadRadius: -8.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: produtoUnidade.imagem,
                    fit: BoxFit.cover,
                    useOldImageOnUrlChange: true,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      produtoUnidade.nome.toUpperCase(),
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
                      maxLines: 3,
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
                    Text(
                      produtoUnidade.preco,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
