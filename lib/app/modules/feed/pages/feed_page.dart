import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:osiris/app/models/Categorias.dart';
import 'package:osiris/app/modules/feed/pages/feed-item-comida.dart';
import 'package:osiris/app/modules/feed/pages/item-categoria.dart';
import '../feed_controller.dart';
import '../../../data/data-test.dart';


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
          physics: AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
                leading: IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: null),
                expandedHeight: 250.0,
                pinned: false,
                backgroundColor: Colors.amber,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  // title: Text('Iporá Delivery'),
                  centerTitle: true,
                   background: Container(
                     color: Colors.amber
                   )
                  //   fit: BoxFit.cover,
                  //  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    tooltip: 'Add new entry',
                    onPressed: (){},
                  ),
                ]),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categorias.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = categorias[index];
                        return GestureDetector(
                          onTap: () {
                            print(categorias[index].nome);
                          },
                          child: ItemCategoria(categorias[index]),
                        );
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 2000,
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comidas.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = comidas[index];
                      return GestureDetector(
                        onTap: () {
                          print(comidas[index].nome);
                        },
                        child: FoodItems(comidas[index]),
                      );
                    },
                  ),
                ),
              ]),
            )
          ],
        )),
      ],
    );
  }
}
