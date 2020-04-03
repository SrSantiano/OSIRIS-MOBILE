import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osiris/app/models/Categoria.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/widgets/streambuilder_produto.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';
import 'package:osiris/app/utils/extension_color.dart';

class LojaCardapioPage extends StatefulWidget {
  final Loja loja;

  const LojaCardapioPage({
    Key key,
    @required this.loja,
  })  : assert(loja != null),
        super(key: key);

  @override
  _LojaCardapioPageState createState() => _LojaCardapioPageState();
}

class _LojaCardapioPageState
    extends ModularState<LojaCardapioPage, LojaPageController>
    with TickerProviderStateMixin {
  Stream<List<Categoria>> _streamCategoria;
  Future<int> _numCategorias;
  TabController _tabController;
  final _pageController = PageController(initialPage: 0);

  @override
  initState() {
    _streamCategoria = controller.repository.getCategorias(widget.loja.uidLojista);

    _numCategorias = _streamCategoria.first.then((value) {
      return value.length;
    }).whenComplete(() {
      setNumber(_numCategorias);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            child: StreamBuilder<List<Categoria>>(
              stream: _streamCategoria,
              builder: (context, snapshot) {
                //lembrar de colocar os connection state;
                if (snapshot.hasError) return Text('${snapshot.error}');

                return Center(
                  child: Container(
                    height: double.infinity,
                    color: Color(widget.loja.tema.corPrimariaLight.toHexFlutterColor()),
                    child: TabBar(
                      indicatorWeight: 3,
                      onTap: (newIndex) {
                        _tabController.animateTo(
                          newIndex,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        _pageController.animateToPage(
                          newIndex,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      indicatorColor: Colors.amber,
                      labelColor: Color(widget.loja.tema.corTextoPrimario.toHexFlutterColor()),
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
                  ),
                );
              },
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 15,
          child: StreamBuilder<List<Categoria>>(
            stream: _streamCategoria,
            builder: (context, snapshot) {
              //lembrar de colocar os connection state;
              if (snapshot.hasError) return Text('${snapshot.error}');
              return PageView.builder(
                controller: _pageController,
                onPageChanged: (newIndex) {
                  _tabController.animateTo(newIndex);
                },
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return StreamBuilderProduto(
                    idCategoria: snapshot.data[position].idCategoria,
                    uidLojista: widget.loja.uidLojista,
                  );
                },
              );
            },
          ),
        ),
      ],
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
