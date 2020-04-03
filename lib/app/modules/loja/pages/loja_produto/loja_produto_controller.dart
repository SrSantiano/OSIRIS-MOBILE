import 'package:mobx/mobx.dart';

part 'loja_produto_controller.g.dart';

class LojaProdutoController = _LojaProdutoControllerBase
    with _$LojaProdutoController;

abstract class _LojaProdutoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
