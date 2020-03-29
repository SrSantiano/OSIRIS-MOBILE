import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/models/Categoria.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/widgets/item_produto_un.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

part 'loja_cardapio_controller.g.dart';

class LojaCardapioController = _LojaCardapioControllerBase
    with _$LojaCardapioController;

abstract class _LojaCardapioControllerBase with Store {
  final ILojaRepository repository;

  @observable
  ObservableStream<List<Categoria>> streamListCategoria;

  _LojaCardapioControllerBase(ILojaRepository this.repository) {
    getListCategorias();
  }

  @action
  getListCategorias() {
    streamListCategoria = getCardapio().asObservable();
  }

  Future<int> getCardapioSize() async {
    int size = 0;
    await for (var i in getCardapio()) {
      size++;
    }
    return size;
  }

  Stream<List<Categoria>> getCardapio() {
    return repository.getCardapio().map((snap) {
      return snap.documents.map((doc) {
        return Categoria.fromDocument(doc);
      }).toList();
    });
  }

  Stream<List<ProdutoUnidade>> getProdutos(String idCategoria) {
    return repository.getProdutos(idCategoria).map((snap) {
      return snap.documents.map((doc) {
        return ProdutoUnidade.fromDocument(doc);
      }).toList();
    });
  }
}
