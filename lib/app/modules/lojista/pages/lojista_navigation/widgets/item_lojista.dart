import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../model/loja.dart';
import '../../../../../utils/extension_color.dart';

class ItemLojista extends StatelessWidget {
  final Loja loja;
  final Function onPressed;

  const ItemLojista({Key key, this.loja, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Color(
                loja.tema.corPrimaria.toHexFlutterColor(),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff8a795d),
                  blurRadius: 20.0,
                  spreadRadius: -8.0,
                  offset: Offset(0.0, 5.0),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: loja.publicacaoImagemInicial,
                          fit: BoxFit.cover,
                          useOldImageOnUrlChange: true,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color(0x00000000),
                              Color(loja.tema.corPrimaria.toHexFlutterColor()),
                            ],
                            tileMode: TileMode.repeated,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          height: 60.0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl: loja.imagemPerfil,
                                fit: BoxFit.cover,
                                useOldImageOnUrlChange: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit
                      .tight, //The child is forced to fill the available space.
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          loja.nomeFantasia.toUpperCase(),
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                            letterSpacing: 0,
                            color: Color(
                              loja.tema.corTextoPrimario.toHexFlutterColor(),
                            ),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          loja.categoriaPrimaria,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.raleway(
                            fontSize: 14.0,
                            color: Color(
                              loja.tema.corTextoPrimario.toHexFlutterColor(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 110,
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: onPressed,
              splashColor: Color(0x50FFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
