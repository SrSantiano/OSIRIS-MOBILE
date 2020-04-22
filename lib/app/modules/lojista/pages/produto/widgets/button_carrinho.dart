import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCarrinho extends StatelessWidget {
  final Decimal value;
  final int qtde;
  final Function onPressed;

  const ButtonCarrinho({
    Key key,
    @required this.value,
    @required this.onPressed,
    @required this.qtde,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        //topRight: Radius.circular(30),
      ),
      child: RawMaterialButton(
        splashColor: Colors.white,
        constraints:
            BoxConstraints.tight(Size(double.infinity, double.infinity)),
        onPressed: onPressed,
        fillColor: Colors.orange,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
            AutoSizeText(
              'Adicionar $qtde ao Carrinho',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
              minFontSize: 15,
            ),
            Expanded(
              child: AutoSizeText(
                'R\$ ${value.toStringAsFixed(2)}',
                style: GoogleFonts.bitter(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
                minFontSize: 18,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
