import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';

abstract class ILojaRepository {
  Stream<QuerySnapshot> getLojasStream();
  Stream<QuerySnapshot> getCardapio();
  Stream<QuerySnapshot> getProdutos(String idCategoria);
  List<Stream<QuerySnapshot>> getProdutos2();
}
