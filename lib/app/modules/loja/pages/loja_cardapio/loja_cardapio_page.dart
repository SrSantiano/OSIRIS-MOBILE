import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osiris/app/models/Categoria.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/widgets/streambuilder_produto.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';

class LojaCardapioPage extends StatefulWidget {
  final String uidLojista;
  final ScrollController scrollController;

  const LojaCardapioPage({
    Key key,
    @required this.uidLojista,
    @required this.scrollController,
  }) : super(key: key);

  @override
  _LojaCardapioPageState createState() => _LojaCardapioPageState();
}

class _LojaCardapioPageState
    extends ModularState<LojaCardapioPage, LojaPageController>
    with TickerProviderStateMixin {
  Stream<List<Categoria>> streamCategoria;
  TabController _tabController;
  final _pageController = PageController(initialPage: 0);

  @override
  initState() {
    streamCategoria = controller.repository.getCategorias(widget.uidLojista);
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
              stream: streamCategoria,
              builder: (context, snapshot) {
                //lembrar de colocar os connection state;
                if (snapshot.hasError) return Text('${snapshot.error}');

                _tabController = TabController(
                  length: snapshot.data.length,
                  initialIndex: 0,
                  vsync: this,
                );

                return Center(
                  child: TabBar(
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
                    labelColor: Colors.blue,
                    labelStyle: GoogleFonts.raleway(
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0,
                      letterSpacing: 0,
                      color: Color(0xFF000000),
                    ),
                    unselectedLabelStyle: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 10,
          child: StreamBuilder<List<Categoria>>(
            stream: streamCategoria,
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
                    uidLojista: widget.uidLojista,
                    scrollController: widget.scrollController,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
