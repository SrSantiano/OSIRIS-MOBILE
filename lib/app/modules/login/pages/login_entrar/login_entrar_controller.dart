import 'package:mobx/mobx.dart';

part 'login_entrar_controller.g.dart';

class LoginEntrarController = _LoginEntrarControllerBase
    with _$LoginEntrarController;

abstract class _LoginEntrarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
