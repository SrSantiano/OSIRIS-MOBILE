import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

import 'iproduto.dart';
import 'produto.dart';

class ProdutoAlimentoUn extends Produto implements IProduto {
  Decimal preco;

  ProdutoAlimentoUn(
      {String idProduto,
      String nome,
      String imagem,
      List<String> ingredientes,
      TipoProdutoEnum tipoProduto,
      String preco})
      : preco = Decimal.parse(preco),
        super(
          idProduto: idProduto,
          nome: nome,
          imagem: imagem,
          ingredientes: ingredientes,
          tipoProduto: tipoProduto,
        );

  factory ProdutoAlimentoUn.fromDocument(DocumentSnapshot doc) {
    return ProdutoAlimentoUn(
        idProduto: doc.documentID,
        nome: doc['nome'] as String,
        imagem: doc['imagem'] as String,
        ingredientes: (doc['ingredientes'] as List<dynamic>)
            .map<String>((value) => value)
            .toList(),
        tipoProduto: TipoProdutoEnum.values
            .firstWhere((e) => describeEnum(e) == doc['tipoProduto']),
        preco: doc['preco']);
  }
}
