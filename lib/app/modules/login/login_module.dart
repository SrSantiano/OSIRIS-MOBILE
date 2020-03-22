import 'package:osiris/app/modules/login/pages/login_cadastro/login_cadastro_page.dart';
import 'package:osiris/app/modules/login/pages/login_entrar/login_entrar_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/login/pages/login_cadastro/login_cadastro_controller.dart';
import 'package:osiris/app/modules/login/pages/login_entrar/login_entrar_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginEntrarController()),
        Bind((i) => LoginCadastroController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginEntrarPage()),
        Router('/cadastro', child: (_, args) => LoginCadastroPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
