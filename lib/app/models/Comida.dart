import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:osiris/app/models/Loja.dart';

class Comida {
  Loja loja;
  String nome;
  double price;
  String imagem;
  List<String> ingredientes;
  List<String> adicionais;
  double avaliacao;
  String id;
  bool alinhamento = true;

  Comida({
    this.nome,
    this.imagem ,
    this.price,
    this.ingredientes,
    this.adicionais,
    this.loja,
    this.avaliacao,
    this.id,
    this.alinhamento = true
  });

  Comida.fromDoc(DocumentSnapshot doc) {
     
      id: doc['id'];
      nome: doc['name'];
      imagem: doc['imagem'];
      price: doc['valor'];
      //ingredientes: doc['bio'] ?? '',
      //adicionais: doc['email'],
      //loja: doc['email'],
      avaliacao: doc['avaliacao'];
      alinhamento: doc['alinhamento'];
    
  }

}