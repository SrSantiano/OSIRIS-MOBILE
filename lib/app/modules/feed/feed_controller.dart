import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/models/Comida.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  Firestore firestore = Firestore.instance;

  @observable
  List<Comida> comidas = List();

  @action
  Future<List<Comida>> listComida() async {
    QuerySnapshot querySnapshot =
        await firestore.collection("Comidas").getDocuments();

    querySnapshot.documents.forEach((doc) {
  
    Comida comida = Comida(
      id: doc.documentID,
      nome: doc['nome'],
      avaliacao: doc['avaliacao'],
      imagem: doc['imagem'],
      price: doc['valor']+0.0
      );
     
      comidas.add(comida);
     
    });
    return comidas;
  }
}
