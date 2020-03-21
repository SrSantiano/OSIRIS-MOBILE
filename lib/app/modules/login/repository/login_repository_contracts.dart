import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginRepository {
  Future<FirebaseUser> getUser();
  Future<void> loginWithEmailAndPassword(String email, String password);
  Future<FirebaseUser> registerWithEmailAndPassword(
      String email, String password);
  Future<FirebaseUser> getGoogleLogin();
  Future<FirebaseUser> getFacebookLogin();
}
