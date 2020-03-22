import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';

class LoginRepository extends Disposable implements ILoginRepository {
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth;

  LoginRepository(this._auth);

  @override
  Future<FirebaseUser> getFacebookLogin() async{
   FacebookLoginResult userFacebook =
        await _facebookLogin.logIn(['email', 'public_profile']);
    FirebaseUser user;
    if (userFacebook.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken facebookAccessToken = userFacebook.accessToken;
      AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: facebookAccessToken.token);
      user = (await _auth.signInWithCredential(credential)).user;
    }
    return user;
  }

  @override
  Future<FirebaseUser> getGoogleLogin() {
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
  Future<void> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      //AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      //return result.user;
    } catch(e) {
      return null;
    }
  }

  @override
  Future getLogOut() {
    return _auth.signOut();
  }
  @override
  void dispose() {}

}
