import 'package:flutter_modular/flutter_modular.dart';

import 'pages/pedido/pedido_controller.dart';

class PedidoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PedidoController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<PedidoModule>.of();
}
