import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osiris/app/models/Categoria.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/loja_cardapio_controller.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/widgets/item_produto_un.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_controller.dart';

class LojaCardapioPage extends StatelessWidget {
  final LojaRepositoryController _lojaRepositoryController = Modular.get();
  final LojaCardapioController _lojaCardapioController = Modular.get();

  final ScrollController scrollController;
  List<String> listCategoria = [];

  LojaCardapioPage({Key key, @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: FirestoreAnimatedList(
              key: ValueKey("categoriaList"),
              onLoaded: (snapshot) {
                _lojaRepositoryController.idCategoria =
                    snapshot.documents.map((value) {
                  return value['idCategoria'] as String;
                }).toList();
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              query: _lojaCardapioController.repository.getCardapio(),
              itemBuilder: (BuildContext context, DocumentSnapshot snapshot,
                  Animation<double> animation, int index) {
                Categoria categoria = Categoria.fromDocument(snapshot);
                return GestureDetector(
                  onTap: () {
                    print("idCategoria ${categoria.idCategoria}");
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: AnimatedDefaultTextStyle(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                        style: index == 0 //mobx
                            ? GoogleFonts.raleway(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                                letterSpacing: 0,
                                color: Color(0xFF000000),
                              )
                            : GoogleFonts.raleway(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                                letterSpacing: 0,
                                color: Color(0x70000000),
                              ),
                        child: AutoSizeText(
                          categoria.nome,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(
              flex: 8,
              child: Observer(
                builder: (context) {
                  return PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _lojaRepositoryController.idCategoria.length,
                    itemBuilder: (context, position) {
                      return FirestoreAnimatedList(
                        key: ValueKey("produtosList"),
                        controller: scrollController,
                        query: _lojaCardapioController.repository
                            .getProdutos2()[position],
                        itemBuilder: (BuildContext context,
                            DocumentSnapshot snapshot,
                            Animation<double> animation,
                            int index) {
                          ProdutoUnidade produtoUnidade =
                              ProdutoUnidade.fromDocument(snapshot);
                          return ItemProdutoUn(
                            produtoUnidade: produtoUnidade,
                          );
                        },
                      );
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
