import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  @observable
  int qtde = 1;

  @action
  void setQtde(int n) {
    if (n > 0) qtde = n;
  }

  @observable
  int currentPosition;

  @observable
  List<String> observacoes;

  @action
  void setTamObservacoes(int tam) {
    observacoes = List<String>(tam);
  }
}
