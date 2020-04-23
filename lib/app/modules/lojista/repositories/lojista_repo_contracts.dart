import '../../../model/categoria.dart';
import '../../../model/iproduto.dart';
import '../../../model/loja.dart';
import '../../../model/unidade.dart';

abstract class ILojistaRepo {
  Stream<List<Loja>> getLojas();
  Stream<List<Categoria>> getCategorias(String uidLojista, {bool mostrarBebidas});
  Stream<List<IProduto>> getProdutos(String uidLojista, String categoria);
  Stream<List<Unidade>> getUnidade(
      String uidLojista, String categoria, String idProduto);
}
