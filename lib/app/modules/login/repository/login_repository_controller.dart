import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';

part 'login_repository_controller.g.dart';

class LoginRepositoryController = _LoginRepositoryControllerBase
    with _$LoginRepositoryController;

abstract class _LoginRepositoryControllerBase with Store {
  final ILoginRepository _loginRepository = Modular.get();

   @observable
  FirebaseUser user;

  @observable
  AuthStatus status = AuthStatus.loading;
  
  
  Future<void> registerWithEmailAndPassword(String email, String password) async {
    await _loginRepository.registerWithEmailAndPassword(email, password);
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
     await _loginRepository.loginWithEmailAndPassword(email, password);
     await _loginRepository.getUser().then((user){
       print(user.uid);
     });
  }


  @action
  setUser(FirebaseUser value){
    user = value;
    status = user == null ?  AuthStatus.logoff : AuthStatus.login;
  }

  @action
  Future loginWithFacebook() async{
    user = await  _loginRepository.getFacebookLogin();
  }

  @action
  Future logOut(){
    return  _loginRepository.getLogOut();
  }

  @action
  Future<FirebaseUser> getUser() async{
    return _loginRepository.getUser();
  }

}
enum AuthStatus{
  loading, login, logoff
}