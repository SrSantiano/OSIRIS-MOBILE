import 'package:osiris/app/models/Loja.dart';

class Comida {
  Loja loja;
  String nome;
  double price;
  String imagem;
  List<String> ingredientes;
  List<String> adicionais;
  double avaliacao;
  int id;
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

}