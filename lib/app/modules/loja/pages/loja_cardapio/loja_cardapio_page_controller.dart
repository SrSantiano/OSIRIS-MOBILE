import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

part 'loja_cardapio_page_controller.g.dart';

class LojaCardapioPageController = _LojaCardapioPageControllerBase
    with _$LojaCardapioPageController;

abstract class _LojaCardapioPageControllerBase with Store {

  final ILojaRepository repository;

  _LojaCardapioPageControllerBase(ILojaRepository this.repository);

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
