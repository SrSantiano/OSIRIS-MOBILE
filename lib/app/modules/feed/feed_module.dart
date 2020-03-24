import 'package:osiris/app/modules/feed/feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/feed/pages/feed-item-detalhes.dart';
import 'package:osiris/app/modules/feed/pages/feed_page.dart';

class FeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FeedPage()),
        Router('/FoodDetails/:comida', child: (_, args) => FoodDetails())
      ];

  static Inject get to => Inject<FeedModule>.of();
}
