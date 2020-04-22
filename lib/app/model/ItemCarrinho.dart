import 'package:osiris/app/model/IProduto.dart';

class ItemCarrinho {
  IProduto produto;
  int quantidade;
  List<String> observacao;

  ItemCarrinho({this.produto, this.quantidade, this.observacao});
}
