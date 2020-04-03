import 'package:osiris/app/modules/loja/pages/loja_produto/loja_produto_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/loja_cardapio_page_controller.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';
import 'package:osiris/app/modules/loja/pages/loja_produto/loja_produto_widget.dart';
import 'package:osiris/app/modules/loja/pages/lojas_page_for_nav/loja_page_for_nav.dart';
import 'package:osiris/app/modules/loja/pages/lojas_page_for_nav/loja_page_for_nav_controller.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

class LojaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LojaProdutoController()),
        Bind((i) => LojaPageController(i.get())),
        Bind((i) => LojaCardapioPageController(i.get())),
        Bind((i) => LojaPageForNavController(i.get())),
        Bind<ILojaRepository>((i) => LojaRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LojaPageForNav()),
        Router('/loja', child: (_, args) => LojaPage(loja: args.data as Loja)),
        /* Router('/loja/:uidLojista',
            child: (_, args) =>
                LojaPage(uidLojista: args.params['uidLojista'] as String)), */
      ];

  static Inject get to => Inject<LojaModule>.of();
}
