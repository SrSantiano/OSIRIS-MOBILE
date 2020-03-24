import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';

class LoginRepository extends Disposable implements ILoginRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth;

  LoginRepository(this._auth);

  @override
  Future<FirebaseUser> getFacebookLogin() async {
    try {
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
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
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
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      //AuthResult result =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //return result.user;
    } catch (e) {
      return null;
    }
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
