import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'iproduto.dart';
import 'produto.dart';
import 'tamanho.dart';

class ProdutoAlimentoTam extends Produto implements IProduto {
  List<Tamanho> tamanho;

  ProdutoAlimentoTam(
      {String idProduto,
      String nome,
      String imagem,
      List<String> ingredientes,
      TipoProdutoEnum tipoProduto,
      this.tamanho})
      : super(
          idProduto: idProduto,
          nome: nome,
          imagem: imagem,
          ingredientes: ingredientes,
          tipoProduto: tipoProduto,
        );

  factory ProdutoAlimentoTam.fromDoc(DocumentSnapshot doc) {
    return ProdutoAlimentoTam(
      idProduto: doc.documentID,
      nome: doc['nome'] as String,
      imagem: doc['imagem'] as String,
      ingredientes: (doc['ingredientes'] as List<dynamic>)
          .map<String>((value) => value)
          .toList(),
      tipoProduto: TipoProdutoEnum.values
          .firstWhere((e) => describeEnum(e) == doc['tipoProduto']),
      tamanho: (doc['tamanho'] as List<dynamic>)
          .map<Tamanho>((value) => Tamanho.fromMap(value))
          .toList(),
    );
  }
}
