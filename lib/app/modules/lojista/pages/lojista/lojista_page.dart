import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/categoria.dart';
import '../../../../model/loja.dart';
import '../../../../utils/extension_color.dart';
import 'lojista_controller.dart';
import 'widgets/streambuilder_produto.dart';

class LojistaPage extends StatefulWidget {
  final Loja _loja;
  
  LojistaPage({Key key, @required Loja loja})
      : _loja = loja,
        assert(loja != null),
        super(key: key);

  @override
  _LojistaPageState createState() => _LojistaPageState();
}

class _LojistaPageState extends ModularState<LojistaPage, LojistaController>
    with TickerProviderStateMixin {
  Stream<List<Categoria>> _streamCategoriaAlimentos;
  Future<int> _numCategorias;
  TabController _tabController;

  @override
  void initState() {
    _streamCategoriaAlimentos = controller.repository.getCategorias(
        widget._loja.uidLojista,
        mostrarBebidas: widget._loja.mostrarBebidasInicio);
    _numCategorias = _streamCategoriaAlimentos.first.then((value) {
      return value.length;
    }).whenComplete(() {
      setNumber(_numCategorias);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          widget._loja.nomeFantasia.toUpperCase(),
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
            color: Color(
              widget._loja.tema.corTextoPrimario.toHexFlutterColor(),
            ),
          ),
          textAlign: TextAlign.right,
          minFontSize: 16,
          maxFontSize: 16,
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Color(
          widget._loja.tema.corPrimaria.toHexFlutterColor(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                height: double.infinity,
                child: StreamBuilder<List<Categoria>>(
                  stream: _streamCategoriaAlimentos,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text('${snapshot.error}');
                    return Center(
                      child: TabBar(
                        onTap: (newIndex) {
/*                     _pageController.animateToPage(
                            newIndex,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          ); */
                        },
                        indicatorColor: Colors.transparent,
                        labelColor: Color(widget._loja.tema.corTextoPrimario
                            .toHexFlutterColor()),
                        labelStyle: GoogleFonts.raleway(
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                          letterSpacing: 0,
                        ),
                        unselectedLabelStyle: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          letterSpacing: 0,
                        ),
                        controller: _tabController,
                        isScrollable: true,
                        tabs: snapshot.data.map((categoria) {
                          return Text(
                            categoria.nome,
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 9,
              child: StreamBuilder<List<Categoria>>(
                stream: _streamCategoriaAlimentos,
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text('${snapshot.error}');
                  return PageView.builder(
                    onPageChanged: (index) {
                      _tabController.index = index;
                    },
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, position) {
                      return StreamBuilderProduto(
                        idCategoria: snapshot.data[position].idCategoria,
                        uidLojista: widget._loja.uidLojista,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setNumber(Future<int> value) async {
    _tabController = TabController(
      length: await value,
      initialIndex: 0,
      vsync: this,
    );
  }
}
