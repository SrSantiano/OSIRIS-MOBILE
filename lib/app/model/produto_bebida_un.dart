import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

import 'iproduto.dart';
import 'produto.dart';
import 'tema_bebida.dart';

class ProdutoBebidaUn extends Produto implements IProduto {
  Decimal preco;
  bool alcoolico;
  TemaBebida tema;

  ProdutoBebidaUn(
      {String idProduto,
      String nome,
      String imagem,
      List<String> ingredientes,
      TipoProdutoEnum tipoProduto,
      String preco,
      this.alcoolico,
      this.tema})
      : preco = Decimal.parse(preco),
        super(
            idProduto: idProduto,
            nome: nome,
            imagem: imagem,
            ingredientes: ingredientes,
            tipoProduto: tipoProduto);

  factory ProdutoBebidaUn.fromDocument(DocumentSnapshot doc) {
    return ProdutoBebidaUn(
      idProduto: doc.documentID,
      nome: doc['nome'] as String,
      imagem: doc['imagem'] as String,
      ingredientes: (doc['tamanho'] as List<dynamic>)
          .map<String>((value) => value)
          .toList(),
      tipoProduto: TipoProdutoEnum.values
          .firstWhere((e) => describeEnum(e) == doc['tipoProduto']),
      preco: doc['preco'] as String,
      alcoolico: doc['alcoolico'],
      tema: TemaBebida.fromMap(doc['tema'] as Map<String, dynamic>),
    );
  }
}
