import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/Categoria.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

class LojaRepository extends Disposable implements ILojaRepository {
  final Firestore firestore;

  LojaRepository(this.firestore);

  @override
  Stream<List<Loja>> getLojas() {
    return firestore
        .collection('Loja')
        .where('usuarioAtivo', isEqualTo: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return Loja.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<List<Categoria>> getCategorias(String uidLojista) {
    return firestore
        .collection('Loja')
        .document(uidLojista)
        .collection('Cardapio')
        .orderBy('ordem', descending: false)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return Categoria.fromDocument(doc);
      }).toList();
    });
  }

/*   @override
  Future<int> numCategorias(String uidLojista) async {
    QuerySnapshot numCategorias = await firestore
        .collection('Loja')
        .document(uidLojista)
        .collection('Cardapio')
        .getDocuments();
    return numCategorias.documents.length;
  } */

  @override
  Stream<List<ProdutoUnidade>> getProdutos(
      String uidLojista, String idCategoria) {
    return firestore
        .collection('Loja')
        .document(uidLojista)
        .collection('Cardapio')
        .document(idCategoria)
        .collection('Produto')
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return ProdutoUnidade.fromDocument(doc);
      }).toList();
    });
  }

  @override
  void dispose() {}

/*    @override
  List<Stream<List<ProdutoUnidade>>> getProdutos(
      String uidLojista, List<String> categoriaIDs) {
    return categoriaIDs.map((str) {
      return firestore
          .collection('Loja')
          .document(str)
          .collection('Produto')
          .snapshots()
          .map((query) {
        return query.documents.map((doc) {
          return ProdutoUnidade.fromDocument(doc);
        }).toList();
      });
    }).toList();
  }  */

}
