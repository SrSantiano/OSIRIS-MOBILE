import '../../app/model/loja.dart';
import 'item_pedido.dart';

class SubPedido {
  Loja loja;
  List<ItemPedido> itensPedido;

  SubPedido({this.loja, this.itensPedido});
}
