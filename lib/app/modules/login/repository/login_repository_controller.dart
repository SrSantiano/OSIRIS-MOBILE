import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';

part 'login_repository_controller.g.dart';

class LoginRepositoryController = _LoginRepositoryControllerBase
    with _$LoginRepositoryController;

abstract class _LoginRepositoryControllerBase with Store {
  final ILoginRepository _loginRepository = Modular.get();

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    await _loginRepository.registerWithEmailAndPassword(email, password);
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
     await _loginRepository.loginWithEmailAndPassword(email, password);
     await _loginRepository.getUser().then((user){
       print(user.uid);
     });
  }
}
