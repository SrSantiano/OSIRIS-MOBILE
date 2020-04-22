import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberPickerQtde extends StatefulWidget {
  final int valorInicial;
  final int valorMinimo;
  final int valorMaximo;
  final ValueChanged<int> onChanged;

  const NumberPickerQtde(
      {Key key,
      @required this.valorInicial,
      @required this.valorMinimo,
      @required this.valorMaximo,
      @required this.onChanged})
      : assert(valorInicial >= valorMinimo && valorMaximo >= valorInicial),
        super(key: key);

  @override
  _NumberPickerQtdeState createState() => _NumberPickerQtdeState();
}

class _NumberPickerQtdeState extends State<NumberPickerQtde> {
  int valorInicial;

  @override
  void initState() {
    valorInicial = widget.valorInicial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AutoSizeText(
              'QTDE:',
              style: GoogleFonts.bitter(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  color: Colors.white,
                  fontSize: 12),
            ),
            ClipOval(
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  splashColor: Colors.white,
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                    size: 35,
                  ),
                  onPressed: () {
                    setState(() {
                      if (valorInicial < widget.valorMaximo) {
                        valorInicial++;
                        widget.onChanged(valorInicial);
                      }
                    });
                  },
                ),
              ),
            ),
            AutoSizeText(
              valorInicial.toString().toUpperCase(),
              style: GoogleFonts.bitter(
                fontWeight: FontWeight.w900,
                letterSpacing: 0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              minFontSize: 25,
            ),
            ClipOval(
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  splashColor: Colors.white,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 35,
                  ),
                  onPressed: () {
                    setState(() {
                      if (valorInicial > widget.valorMinimo) {
                        valorInicial--;
                        widget.onChanged(valorInicial);
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
