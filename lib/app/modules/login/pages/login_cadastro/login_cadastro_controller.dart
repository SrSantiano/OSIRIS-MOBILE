import 'package:mobx/mobx.dart';

part 'login_cadastro_controller.g.dart';

class LoginCadastroController = _LoginCadastroControllerBase
    with _$LoginCadastroController;

abstract class _LoginCadastroControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
