import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../repository/login_repository_controller.dart';

part 'login_cadastro_controller.g.dart';

class LoginCadastroController = _LoginCadastroControllerBase
    with _$LoginCadastroController;

abstract class _LoginCadastroControllerBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  final LoginRepositoryController _auth = Modular.get();

  @action
  Future<void> registerWithEmailAndPassword() async {
    try {
      await _auth.registerWithEmailAndPassword(email, password);
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  Future loginWithFacebook() async {
    try {
      if (await _auth.loginWithFacebook() != null) {
        Modular.to.pushReplacementNamed('/feed');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      if (await _auth.loginWithGoogle() != null) {
        Modular.to.pushReplacementNamed('/feed');
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
