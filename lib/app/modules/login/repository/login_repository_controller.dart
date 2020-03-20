import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';

part 'login_repository_controller.g.dart';

class LoginRepositoryController = _LoginRepositoryControllerBase
    with _$LoginRepositoryController;

abstract class _LoginRepositoryControllerBase with Store {
  final ILoginRepository _loginRepository = Modular.get();

  Future registerWithEmailAndPassword(String email, String password) async{
    await _loginRepository.registerWithEmailAndPassword(email, password);
  }
}
