import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../model/produto_bebida_tam.dart';
import '../../../../../model/unidade.dart';
import '../../../../../utils/extension_color.dart';
import '../lojista_controller.dart';
import 'numberpicker_beb.dart';

class ItemBebidaTam extends StatefulWidget {
  final ProdutoBebidaTam _produtoBebida;
  final String uidLojista;
  final String idCategoria;

  const ItemBebidaTam(this._produtoBebida, this.uidLojista, this.idCategoria);

  @override
  _ItemBebidaTamState createState() => _ItemBebidaTamState();
}

class _ItemBebidaTamState
    extends ModularState<ItemBebidaTam, LojistaController> {
  Stream<List<Unidade>> _streamUnidade;
  @override
  void initState() {
    _streamUnidade = controller.repository.getUnidade(
        widget.uidLojista, widget.idCategoria, widget._produtoBebida.idProduto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 125,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 4,
                        child: Container(
                          color: Color(widget._produtoBebida.tema.corSecundaria
                              .toHexFlutterColor()),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Container(
                          color: Color(widget._produtoBebida.tema.corPrimaria
                              .toHexFlutterColor()),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  child: Container(
                    height: 87.5,
                    color: Color(widget._produtoBebida.tema.corPrimaria
                        .toHexFlutterColor()),
                    child: Center(
                      child: AutoSizeText(
                        widget._produtoBebida.nome.toUpperCase(),
                        softWrap: false,
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0,
                            color: Color(0x15FFFFFF)),
                        minFontSize: 50,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CachedNetworkImage(
                          imageUrl: widget._produtoBebida.imagem,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: AutoSizeText(
                            widget._produtoBebida.nome.toUpperCase(),
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                              color: Color(widget._produtoBebida.tema.corTexto
                                  .toHexFlutterColor()),
                            ),
                            minFontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //SizedBox(height: 3),
          SizedBox(
            height: 3,
          ),
          StreamBuilder<List<Unidade>>(
            stream: _streamUnidade,
            builder: (context, snapshot) {
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                separatorBuilder: (context, position) => SizedBox(height: 3),
                itemBuilder: (context, index) =>
                    itemBebTam(index, snapshot.data[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget itemBebTam(int index, Unidade tamanho) {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ClipRRect(
              borderRadius: index == 0
                  ? BorderRadius.only(topRight: Radius.circular(30))
                  : BorderRadius.only(topRight: Radius.circular(0)),
              child: Container(
                color: Colors.grey[600],
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      AutoSizeText(
                        tamanho.quantidade.toUpperCase(),
                        style: GoogleFonts.bitter(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                        minFontSize: 20,
                      ),
                      AutoSizeText(
                        'R\$ ${tamanho.preco.toStringAsFixed(2)}',
                        style: GoogleFonts.bitter(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                        minFontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: NumberPickerBeb(
              valorInicial: 0,
              valorMinimo: 0,
              valorMaximo: 10,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
