import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';

class Tamanho {
  String tamanho;
  Decimal preco;

  Tamanho({
    this.tamanho,
    String preco,
  }) : this.preco = Decimal.parse(preco);

  factory Tamanho.fromMap(Map<String, dynamic> map) {
    return Tamanho(
      tamanho: map['tamanho'] as String,
      preco: map['preco'] as String,
    );
  }

  factory Tamanho.fromDocument(DocumentSnapshot doc) {
    return Tamanho(
      tamanho: doc['tamanho'] as String,
      preco: doc['preco'] as String,
    );
  }
}