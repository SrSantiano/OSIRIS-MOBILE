import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/produto_alimento_un.dart';
import '../lojista_navigation/lojista_navigation_controller.dart';
import 'produto_controller.dart';
import 'widgets/button_carrinho.dart';
import 'widgets/numberpicker_qtde.dart';

class ProdutoPage extends StatefulWidget {
  final ProdutoAlimentoUn produtoAlimentoUn;
  ProdutoPage({
    Key key,
    @required this.produtoAlimentoUn,
  }) : super(key: key);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends ModularState<ProdutoPage, ProdutoController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 8,
                    child: Hero(
                      tag: '${widget.produtoAlimentoUn.idProduto}__herotag',
                      child: Container(
                        height: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: widget.produtoAlimentoUn.imagem,
                          useOldImageOnUrlChange: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 9,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.produtoAlimentoUn.nome.toUpperCase(),
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
                                  Text(
                                    widget.produtoAlimentoUn.getIngredientes(),
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
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: NumberPickerQtde(
                              valorInicial: 1,
                              valorMinimo: 1,
                              valorMaximo: 10,
                              onChanged: controller.setQtde,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ButtonCarrinho(
                      qtde: controller.qtde,
                      value: Decimal.fromInt(controller.qtde) *
                          widget.produtoAlimentoUn.preco,
                      onPressed: () {
                        showModalBottomSheet(
                          //isDismissible: false,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (ctx) {
                            return CarrinhoBottomSheet(
                                controller.qtde, widget.produtoAlimentoUn);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                left: 10,
                child: ClipOval(
                  child: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CarrinhoBottomSheet extends StatefulWidget {
  final int qtde;
  final ProdutoAlimentoUn produtoAlimentoUn;

  const CarrinhoBottomSheet(this.qtde, this.produtoAlimentoUn);

  @override
  _CarrinhoBottomSheetState createState() => _CarrinhoBottomSheetState();
}

class _CarrinhoBottomSheetState
    extends ModularState<CarrinhoBottomSheet, ProdutoController> {
  final PageController _pageController = PageController();
  final LojistaNavigationController itensPedidos = Modular.get();
  int currentPosition = 0;
  bool isDisableButton = true;

  @override
  void initState() {
    controller.setTamObservacoes(widget.qtde);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      //resizeToAvoidBottomPadding: true,

      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          color: Colors.white,
          //height: double.infinity,
          child: Stack(
            children: <Widget>[
              PageView.builder(
                onPageChanged: (newIndex) {
                  setState(() {
                    if (newIndex != 0) {
                      isDisableButton = false;
                    } else {
                      isDisableButton = true;
                    }
                  });
                  currentPosition = newIndex;
                },
                controller: _pageController,
                itemCount: widget.qtde,
                itemBuilder: (context, position) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 40.0, left: 30.0),
                          child: Text(
                            '${position + 1}º item - Deseja adicionar uma observação?',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w300,
                              fontSize: 30.0,
                              color: Color(
                                0xff000000,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[100],
                            ),
                            child: TextFormField(
                              initialValue: controller.observacoes[position],
                              onChanged: (str) {
                                controller.observacoes[position] = str;
                              },
                              cursorColor: Colors.amber,
                              maxLines: 10,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none,
                                  hintText:
                                      'Adicionar observação ao ${position + 1}º produto. Caso não queira modificar algo não é necessário digitar e tocar em \"Avançar\".'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      color: Colors.amber,
                      disabledColor: Color(0x50000000),
                      label: Text('Voltar'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      icon: Icon(Icons.navigate_before),
                      onPressed: isDisableButton
                          ? null
                          : () => _pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              ),
                    ),
                    FlatButton.icon(
                      color: Colors.amber,
                      label: Text('Avançar'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      icon: Icon(Icons.navigate_next),
                      onPressed: () {
                        if ((currentPosition + 1) != widget.qtde) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {}
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
