import '../../app/model/item_carrinho.dart';
import '../../app/model/loja.dart';

class Carrinho {
  Loja loja;
  List<ItemCarrinho> itensCarrinho;

  Carrinho({this.loja, this.itensCarrinho});
}
