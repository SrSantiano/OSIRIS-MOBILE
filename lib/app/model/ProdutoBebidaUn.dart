import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:osiris/app/model/IProduto.dart';
import 'package:osiris/app/model/Produto.dart';
import 'package:osiris/app/model/TemaBebida.dart';

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

  @override
  Decimal precoDecimal({int index = 0}) => null;

  @override
  Object getProduto({int index = 0}) {
    return this;
  }
}
