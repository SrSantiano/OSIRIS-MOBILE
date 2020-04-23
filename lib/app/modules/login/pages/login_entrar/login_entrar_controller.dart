import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../repository/login_repository_controller.dart';

part 'login_entrar_controller.g.dart';

class LoginEntrarController = _LoginEntrarControllerBase
    with _$LoginEntrarController;

abstract class _LoginEntrarControllerBase with Store {
  final LoginRepositoryController _auth = Modular.get();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool logado = false;

  @action
  Future<void> loginWithEmailAndPassword() async {
    try {
      await _auth.loginWithEmailAndPassword(email, password);
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  Future<void> loginWithFacebook() async {
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

  @observable
  FirebaseUser user;

  @action
  Future getUser() async {
    return user = await _auth.getUser();
  }

  @action
  Future logo() async {
    if (await _auth.getUser() != null) {
      Modular.to.pushReplacementNamed('/feed');
    }
  }
}
