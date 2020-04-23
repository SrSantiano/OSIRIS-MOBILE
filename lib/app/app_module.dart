import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/carrinho/pages/carrinho/carrinho_controller.dart';
import 'modules/feed/feed_controller.dart';
import 'modules/feed/feed_module.dart';
import 'modules/login/repository/login_repository.dart';
import 'modules/login/repository/login_repository_contracts.dart';
import 'modules/login/repository/login_repository_controller.dart';
import 'modules/lojista/lojista_module.dart';
import 'modules/lojista/repositories/lojista_repo.dart';
import 'modules/lojista/repositories/lojista_repo_contracts.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ILojistaRepo>((i) => LojistaRepo(Firestore.instance)),
        Bind((i) => CarrinhoController()),
        Bind((i) => AppController()),
        Bind((i) => LoginRepositoryController()),
        Bind<ILoginRepository>((i) => LoginRepository(FirebaseAuth.instance)),
        Bind((i) => FeedController())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LojistaModule()),
        Router('/feed', module: FeedModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
