import 'package:flutter_modular/flutter_modular.dart';
import 'feed_controller.dart';
import 'pages/feed_page.dart';

class FeedModule extends ChildModule {
  
  @override
  List<Bind> get binds => [
        Bind((i) => FeedController()),
      ];

  @override
  List<Router> get routers => [
        Router('/feed', child: (_, args) => FeedPage()),
      ];

  static Inject get to => Inject<FeedModule>.of();
}
