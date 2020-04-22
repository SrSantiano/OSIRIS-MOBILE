import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/model/IProduto.dart';
import 'package:osiris/app/model/Categoria.dart';
import 'package:osiris/app/model/Produto.dart';
import 'package:osiris/app/model/ProdutoAlimentoUn.dart';
import 'package:osiris/app/model/ProdutoBebidaTam.dart';
import 'package:osiris/app/model/Loja.dart';
import 'package:osiris/app/model/Unidade.dart';
import 'package:osiris/app/modules/lojista/repositories/lojista_repo_contracts.dart';

class LojistaRepo extends Disposable implements ILojistaRepo {
  final Firestore firestore;

  LojistaRepo(this.firestore);

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
  Stream<List<Categoria>> getCategorias(
      String uidLojista, bool mostrarBebidas) {
    if (mostrarBebidas) {
      return firestore
          .collection('Loja')
          .document(uidLojista)
          .collection('Produtos')
          .orderBy('posicao')
          .snapshots()
          .map((query) {
        return query.documents.map((doc) {
          return Categoria.fromDocument(doc);
        }).toList();
      });
    } else {
      return firestore
          .collection('Loja')
          .document(uidLojista)
          .collection('Produtos')
          .where('tipoCategoria',
              isEqualTo: describeEnum(TipoCategoriaEnum.ALIM))
          .orderBy('posicao')
          .snapshots()
          .map((query) {
        return query.documents.map((doc) {
          return Categoria.fromDocument(doc);
        }).toList();
      });
    }
  }

  @override
  Stream<List<IProduto>> getProdutos(String uidLojista, String categoria) {
    return firestore
        .collection('Loja')
        .document(uidLojista)
        .collection('Produtos')
        .document(categoria)
        .collection('Produtos')
        .snapshots()
        .map((query) {
      return query.documents.map<IProduto>((doc) {
        switch (TipoProdutoEnum.values
            .firstWhere((e) => describeEnum(e) == doc['tipoProduto'])) {
          case TipoProdutoEnum.PRODALIMENTOUN:
            return ProdutoAlimentoUn.fromDocument(doc);
          case TipoProdutoEnum.PRODBEBIDATAM:
            return ProdutoBebidaTam.fromDocument(doc);
          default:
            return null;
        }
      }).toList();
    });
  }

  @override
  Stream<List<Unidade>> getUnidade(
      String uidLojista, String categoria, String idProduto) {
    return firestore
        .collection('Loja')
        .document(uidLojista)
        .collection('Produtos')
        .document(categoria)
        .collection('Produtos')
        .document(idProduto)
        .collection('Unidade')
        .snapshots()
        .map((query) {
      return query.documents.map<Unidade>((doc) {
        return Unidade.fromDocument(doc);
      }).toList();
    });
  }

  @override
  void dispose() {}
}
