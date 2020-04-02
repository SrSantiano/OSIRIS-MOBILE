import 'package:osiris/app/models/Categoria.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';

abstract class ILojaRepository {
  Stream<List<Loja>> getLojas();
  Stream<List<Categoria>> getCategorias(String uidLojista);
  Stream<List<ProdutoUnidade>> getProdutos(
      String uidLojista, String idCategoria);
 //  Future<int> numCategorias(String uidLojista); 
}
