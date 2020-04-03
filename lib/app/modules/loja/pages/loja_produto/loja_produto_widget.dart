import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';

class LojaProdutoWidget extends StatelessWidget {
  final ProdutoUnidade produtoUnidade;

  const LojaProdutoWidget([this.produtoUnidade]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      produtoUnidade.nome.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w900,
                        fontSize: 25.0,
                        letterSpacing: 0,
                        color: Color(
                          0xff000000,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(produtoUnidade.getIngredientes(),
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        letterSpacing: 0,
                        height: 1.3,
                        color: Color(
                          0xff000000,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
