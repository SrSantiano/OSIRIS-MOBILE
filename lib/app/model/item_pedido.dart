import 'iproduto.dart';

class ItemPedido {
  IProduto produto;
  int quantidade;
  List<String> observacao;

  ItemPedido({this.produto, this.quantidade, this.observacao});
}
