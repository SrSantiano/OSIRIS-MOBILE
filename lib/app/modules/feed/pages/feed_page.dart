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
                    child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FoodDetails(foods[0],),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 40.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: foods[0].id,
                    child: Container(
                      width: double.infinity,
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage(foods[0].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 12.0, 40.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          foods[0].name,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          iconSize: 30.0,
                          color: Theme.of(context).primaryColor,
                          onPressed: () => print('Favorite ${foods[0].name}'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 0.0, 40.0, 12.0),
                    child: Text(
                      foods[0].empresa.name,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),,
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
