import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum TipoCategoriaEnum { ALIM, BEB }

class Categoria {
  String idCategoria;
  String nome;
  TipoCategoriaEnum tipoCategoria;

  Categoria({this.idCategoria, this.nome, this.tipoCategoria});

  factory Categoria.fromDocument(DocumentSnapshot doc) {
    return Categoria(
      idCategoria: doc.documentID,
      nome: doc['nome'] as String,
      tipoCategoria: TipoCategoriaEnum.values
          .firstWhere((e) => describeEnum(e) == doc['tipoCategoria']),
    );
  }
}
