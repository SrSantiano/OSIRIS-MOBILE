import 'package:osiris/app/model/Categoria.dart';
import 'package:osiris/app/model/IProduto.dart';
import 'package:osiris/app/model/Loja.dart';
import 'package:osiris/app/model/Unidade.dart';

abstract class ILojistaRepo {
  Stream<List<Loja>> getLojas();
  Stream<List<Categoria>> getCategorias(String uidLojista, bool mostrarBebidas);
  Stream<List<IProduto>> getProdutos(String uidLojista, String categoria);
  Stream<List<Unidade>> getUnidade(
      String uidLojista, String categoria, String idProduto);
}
