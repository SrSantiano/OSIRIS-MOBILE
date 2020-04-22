import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberPickerBeb extends StatefulWidget {
  final int valorInicial;
  final int valorMinimo;
  final int valorMaximo;
  final ValueChanged<int> onChanged;

  const NumberPickerBeb({
    Key key,
    @required this.valorInicial,
    @required this.valorMinimo,
    @required this.valorMaximo,
    @required this.onChanged,
  })  : assert(valorInicial >= valorMinimo && valorMaximo >= valorInicial),
        super(key: key);

  @override
  _NumberPickerBebState createState() => _NumberPickerBebState();
}

class _NumberPickerBebState extends State<NumberPickerBeb> {
  int valorInicial;

  @override
  void initState() {
    valorInicial = widget.valorInicial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Material(
            type: MaterialType.transparency,
            child: IconButton(
              splashColor: Colors.white,
              icon: Icon(
                Icons.keyboard_arrow_left,
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
        AutoSizeText(
          valorInicial.toString().toUpperCase(),
          style: GoogleFonts.bitter(
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
          minFontSize: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Material(
            type: MaterialType.card,
            color: Colors.white,
            child: IconButton(
              splashColor: Colors.amber,
              icon: Icon(
                Icons.keyboard_arrow_right,
                size: 30,
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
      ],
    );
  }
}
