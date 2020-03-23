import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/login/repository/login_repository_controller.dart';
import 'package:osiris/app/modules/loja/pages/lojas_page/loja_page.dart';
import 'package:osiris/app/modules/loja/pages/lojas_page/loja_page_controller.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

class LojaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LojaPageController(i.get())),
        Bind<ILojaRepository>((i) => LojaRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LojaPage()),
      ];

  static Inject get to => Inject<LojaModule>.of();
}
