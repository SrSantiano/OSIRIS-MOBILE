import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginRepository {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getEmailPasswordLogin(String email, String password);
  Future<FirebaseUser> registerWithEmailAndPassword(String email, String password);
  Future<FirebaseUser> getGoogleLogin();
  Future<FirebaseUser> getFacebookLogin();
}
