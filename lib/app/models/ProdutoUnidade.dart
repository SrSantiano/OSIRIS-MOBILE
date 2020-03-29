import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:osiris/app/models/IProduto.dart';
import 'package:osiris/app/models/Produto.dart';

import 'TipoProdutoEnum.dart';

class ProdutoUnidade extends Produto implements IProduto {
  Decimal _preco;

  ProdutoUnidade(
      {String idProduto,
      String nome,
      String imagem,
      List<String> ingredientes,
      TipoProdutoEnum tipoProduto,
      String preco})
      : this._preco = Decimal.parse(preco),
        super(
          idProduto: idProduto,
          nome: nome,
          imagem: imagem,
          ingredientes: ingredientes,
          tipoProduto: tipoProduto,
        );

  String getIngredientes() {
    if (this.ingredientes.length > 1) {
      return this.ingredientes.join(',');
    } else {
      return "";
    }
  }

  factory ProdutoUnidade.fromDocument(DocumentSnapshot doc) {
    return ProdutoUnidade(
        idProduto: doc['idProduto'] as String,
        nome: doc['nome'] as String,
        imagem: doc['imagem'] as String,
        ingredientes: (doc['ingredientes'] as List<dynamic>)
            .map<String>((value) => value)
            .toList(),
        tipoProduto: TipoProdutoEnum.values
            .firstWhere((e) => describeEnum(e) == doc['tipoProduto']),
        preco: doc['preco']);
  }

  String get preco => this._preco.toString();

  @override
  Object get produto => this;
}
