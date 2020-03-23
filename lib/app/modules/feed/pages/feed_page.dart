import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../feed_controller.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed"}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.close) , onPressed: controller.logOut)
          ],
        ),
        body: Observer(
          builder: (_) => Column(
            children: <Widget>[

              Text(controller.user.displayName + controller.user.email)
            ],
          ),
        ));
  }
}
