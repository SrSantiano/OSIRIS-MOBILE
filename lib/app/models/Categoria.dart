import 'package:cloud_firestore/cloud_firestore.dart';

class Categoria {
  String idCategoria;
  String nome;

  Categoria({this.idCategoria, this.nome});

  factory Categoria.fromDocument(DocumentSnapshot doc) {
    return Categoria(
      idCategoria: doc.documentID,
      nome: doc['nome'],
    );
  }
}
