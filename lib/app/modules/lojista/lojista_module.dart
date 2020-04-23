import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/lojista/lojista_controller.dart';
import 'pages/lojista/lojista_page.dart';
import 'pages/lojista_navigation/lojista_navigation_controller.dart';
import 'pages/lojista_navigation/lojista_navigation_page.dart';
import 'pages/produto/produto_controller.dart';
import 'pages/produto/produto_page.dart';
import 'repositories/lojista_repo.dart';
import 'repositories/lojista_repo_contracts.dart';

class LojistaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LojistaNavigationController(i.get<ILojistaRepo>())),
        Bind((i) => ProdutoController()),
        Bind((i) => LojistaController(i.get<ILojistaRepo>())),
        Bind((i) => LojistaNavigationController(i.get<ILojistaRepo>())),
        Bind<ILojistaRepo>((i) => LojistaRepo(Firestore.instance))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => LojistaNavigationPage()),
        Router('/lojista', child: (_, args) => LojistaPage(loja: args.data)),
        Router('/produto',
            child: (_, args) => ProdutoPage(produtoAlimentoUn: args.data)),
      ];

  static Inject get to => Inject<LojistaModule>.of();
}
