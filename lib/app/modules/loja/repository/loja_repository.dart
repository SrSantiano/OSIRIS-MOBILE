import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

class LojaRepository implements ILojaRepository {
  final Firestore firestore;

  LojaRepository(this.firestore);

  @override
  Stream<List<Loja>> getLojas() {
    return firestore
        .collection('Loja')
        .where('usuarioAtivo', isEqualTo: true)
        //posicionar por abertos
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return Loja.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<QuerySnapshot> getLojasStream() {
    return firestore
        .collection('Loja')
        .where('usuarioAtivo', isEqualTo: true)
        .snapshots();
  }
}
