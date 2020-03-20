import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginRepository {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getEmailPasswordLogin();
  Future<FirebaseUser> getGoogleLogin();
  Future<FirebaseUser> getFacebookLogin();
}
