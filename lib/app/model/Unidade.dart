import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

enum TipoUnidadeEnum { PESO, VOLUME }

class Unidade {
  String idProduto;
  String quantidade;
  Decimal preco;
  TipoUnidadeEnum tipoUnidadeEnum;

  Unidade(
      {this.idProduto,
      this.quantidade,
      String preco,
      TipoUnidadeEnum tipoUnidade})
      : preco = Decimal.parse(preco);

  factory Unidade.fromDocument(DocumentSnapshot doc) {
    return Unidade(
      idProduto: doc.reference.parent().id,
      preco: doc['preco'] as String,
      quantidade: doc['quantidade'] as String,
      tipoUnidade: TipoUnidadeEnum.values
          .firstWhere((e) => describeEnum(e) == doc['tipoUnidade']),
    );
  }
}
