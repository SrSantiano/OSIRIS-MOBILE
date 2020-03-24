import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:osiris/app/models/Loja.dart';

abstract class ILojaRepository {
  Stream<List<Loja>> getLojas();

  Stream<QuerySnapshot> getLojasStream();
}
