import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/modules/feed/pages/lista_categorias.dart';
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
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.amber,
                    ),
                    onPressed: () {},
                  ),
                  expandedHeight: 250.0,
                  pinned: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    //title: Text('Food Hoouse'),
                    centerTitle: true,
                    background: Image.asset(
                      'assets/foodhouse7.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.amber,
                      ),
                      onPressed: () {},
                    ),
                  ]),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 200,
                    child: ListaDeCategorias(),
                    color: Colors.transparent,
                  ),
                  Container(
                    color: Colors.red,
                    height: 1250,
                  ),
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
