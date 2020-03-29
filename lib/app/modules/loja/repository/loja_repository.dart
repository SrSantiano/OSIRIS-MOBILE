import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

import 'loja_repository_controller.dart';

class LojaRepository implements ILojaRepository {
  final Firestore firestore;
  final LojaRepositoryController _controller = Modular.get();

  LojaRepository(this.firestore);

  @override
  Stream<QuerySnapshot> getLojasStream() {
    return firestore
        .collection('Loja')
        .where('usuarioAtivo', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getCardapio() {
    return firestore
        .collection('Loja')
        .document(_controller.uidLojista)
        .collection('Cardapio')
        .orderBy('ordem', descending: false)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot> getProdutos(String idCategoria) {
    return firestore
        .collection('Loja')
        .document(_controller.uidLojista)
        .collection('Cardapio')
        .document(idCategoria)
        .collection('Produto')
        .snapshots();
  }

  @override
  List<Stream<QuerySnapshot>> getProdutos2() {
    return _controller.idCategoria.map((str) {
      return firestore
          .collection('Loja')
          .document(_controller.uidLojista)
          .collection('Cardapio')
          .document(str)
          .collection('Produto')
          .snapshots();
    }).toList();
  }
}
