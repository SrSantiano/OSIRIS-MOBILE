import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../repository/login_repository_controller.dart';

part 'login_entrar_controller.g.dart';

class LoginEntrarController = _LoginEntrarControllerBase
    with _$LoginEntrarController;

abstract class _LoginEntrarControllerBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  LoginRepositoryController _auth = Modular.get();

  @action
  Future<void> loginWithEmailAndPassword() async {
    try {
      await _auth.loginWithEmailAndPassword(this.email, this.password);
    } catch (e) {
      print(e);
    }
  }
}
