import 'package:osiris/app/model/Loja.dart';
import 'package:osiris/app/model/ItemCarrinho.dart';

class Carrinho{
  Loja loja;
  List<ItemCarrinho> itensCarrinho;

  Carrinho({this.loja, this.itensCarrinho});
}