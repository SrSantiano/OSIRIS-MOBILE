import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:osiris/app/model/IProduto.dart';
import 'package:osiris/app/model/Produto.dart';
import 'package:osiris/app/model/TemaBebida.dart';

class ProdutoBebidaTam extends Produto implements IProduto{
  bool alcoolico;
  TemaBebida tema;

  ProdutoBebidaTam(
      {String idProduto,
      String nome,
      String imagem,
      List<String> ingredientes,
      TipoProdutoEnum tipoProduto,
      this.alcoolico,
      this.tema})
      : super(
          idProduto: idProduto,
          nome: nome,
          imagem: imagem,
          ingredientes: ingredientes,
          tipoProduto: tipoProduto,
        );

  factory ProdutoBebidaTam.fromDocument(DocumentSnapshot doc) {
    return ProdutoBebidaTam(
      idProduto: doc.documentID,
      nome: doc['nome'] as String,
      imagem: doc['imagem'] as String,
      ingredientes: (doc['ingredientes'] as List<dynamic>)
          .map<String>((value) => value)
          .toList(),
      tipoProduto: TipoProdutoEnum.values
          .firstWhere((e) => describeEnum(e) == doc['tipoProduto']),
      alcoolico: doc['alcoolico'],
      tema: TemaBebida.fromMap(doc['tema'] as Map<String, dynamic>),
    );
  }
}
