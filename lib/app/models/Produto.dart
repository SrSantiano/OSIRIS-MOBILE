import 'TipoProdutoEnum.dart';

abstract class Produto{
  String idProduto;
  String nome;
  String imagem;
  List<String> ingredientes;
  TipoProdutoEnum tipoProduto;


  Produto({this.idProduto, this.nome, this.imagem, this.ingredientes, this.tipoProduto});
}