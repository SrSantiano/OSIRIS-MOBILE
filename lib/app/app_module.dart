import 'package:firebase_auth/firebase_auth.dart';
import 'package:osiris/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:osiris/app/app_widget.dart';
import 'package:osiris/app/modules/feed/feed_controller.dart';
import 'package:osiris/app/modules/feed/feed_module.dart';
import 'package:osiris/app/modules/login/repository/login_repository.dart';
import 'package:osiris/app/modules/login/repository/login_repository_contracts.dart';
import 'package:osiris/app/modules/loja/loja_module.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';
import 'modules/feed/feed_controller.dart';
import 'modules/feed/feed_module.dart';
import 'modules/login/repository/login_repository_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginRepositoryController()),
        Bind((i) => LojaPageController()),
        Bind<ILoginRepository>((i) => LoginRepository(FirebaseAuth.instance)),
        Bind((i) => FeedController())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LojaModule()),
        Router('/feed', module: FeedModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
