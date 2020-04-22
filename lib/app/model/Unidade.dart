import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';

enum TipoUnidadeEnum { PESO, VOLUME }

class Unidade {
  //DocumentReference doc;
  String quantidade;
  Decimal preco;
  TipoUnidadeEnum tipoUnidadeEnum;

  Unidade({this.quantidade, String preco, TipoUnidadeEnum tipoUnidade})
      : this.preco = Decimal.parse(preco);

  factory Unidade.fromDocument(DocumentSnapshot doc) {
    print('path: ${doc.documentID}');
    return Unidade(
      preco: doc['preco'] as String,
      quantidade: doc['quantidade'] as String,
      tipoUnidade: TipoUnidadeEnum.values
          .firstWhere((e) => describeEnum(e) == doc['tipoUnidade']),
    );
  }

  /* String getProdutoId() {
    return this.doc.parent().id;
  } */
}
