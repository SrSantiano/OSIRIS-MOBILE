import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_repository_contracts.dart';

class LoginRepository extends Disposable implements ILoginRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth;

  LoginRepository(this._auth);

  @override
  Future<FirebaseUser> getFacebookLogin() async {
    try {
      var userFacebook =
          await _facebookLogin.logIn(['email', 'public_profile']);
      FirebaseUser user;

      if (userFacebook.status == FacebookLoginStatus.loggedIn) {
        var facebookAccessToken = userFacebook.accessToken;
        var credential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);
        user = (await _auth.signInWithCredential(credential)).user;
      }
      return user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user = (await _auth.signInWithCredential(credential)).user;
    print('signed in ${user.displayName}');
    return user;
  }

  @override
  Future<FirebaseUser> getUser() => _auth.currentUser();

  @override
  Future<FirebaseUser> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    //AuthResult result =
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    //return result.user;
  }

  @override
  Future getLogOut() async {
    if (await _facebookLogin.isLoggedIn) {
      _facebookLogin.logOut();
    }
    return _auth.signOut();
  }

  @override
  void dispose() {}
}
