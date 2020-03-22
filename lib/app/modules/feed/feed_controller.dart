import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/login/repository/login_repository_controller.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  LoginRepositoryController _auth = Modular.get();

  @observable
  FirebaseUser user;

  @action
  Future getUser() async {
    return user = await _auth.getUser();
  }
}
