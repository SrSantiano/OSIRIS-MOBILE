import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';

class LoginRepository extends Disposable implements ILoginRepository {
  final FirebaseAuth _auth;

  LoginRepository(this._auth);

  @override
  Future<FirebaseUser> getEmailPasswordLogin(
      String email, String password) async {
    return null;
  }

  @override
  Future<FirebaseUser> getFacebookLogin() {
    // TODO: implement getFacebookLogin
    return null;
  }

  @override
  Future<FirebaseUser> getGoogleLogin() {
    // TODO: implement getGoogleLogin
    return null;
  }

  @override
  Future<FirebaseUser> getUser() => _auth.currentUser();

  @override
  Future<FirebaseUser> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
