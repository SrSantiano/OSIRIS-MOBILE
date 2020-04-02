import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:osiris/app/models/Comida.dart';
import 'package:osiris/app/modules/feed/pages/widgets/feed-item-comida.dart';
import 'package:osiris/app/modules/feed/pages/widgets/item-categoria.dart';
import '../feed_controller.dart';
import '../../../data/data-test.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed"}) : super(key: key);
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedController> {
  changeState(item, items) {
    setState(() {
      for (var i in items) {
        if (i == item) {
          if (item.ativo == true) {
            item.ativo = false;
          } else {
            item.ativo = true;
          }
        } else {
          i.ativo = false;
        }
      }
    });
  }

  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Scaffold(
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: _selectedIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
                print(_selectedIndex);
              }),
              items: [
                BottomNavyBarItem(
                  textAlign: TextAlign.center,
                  icon: Icon(Icons.apps),
                  title: Text('Home'),
                  activeColor: Colors.amber,
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.store),
                    title: Text('Lojas'),
                    activeColor: Colors.amber),
                BottomNavyBarItem(
                    icon: Icon(Icons.monetization_on),
                    title: Text('Promoções'),
                    activeColor: Colors.amber),
                BottomNavyBarItem(
                    icon: Icon(Icons.favorite),
                    title: Text('Favoritos'),
                    activeColor: Colors.amber),
              ],
            ),
            body: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                    leading: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.amber,
                        ),
                        onPressed: null),
                    expandedHeight: 250.0,
                    pinned: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                        // title: Text('Iporá Delivery'),
                        centerTitle: true,
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[],
                        )
                        //   fit: BoxFit.cover,
                        //  ),
                        ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.amber,
                        ),
                        tooltip: 'Add new entry',
                        onPressed: () {},
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
                            //categorias[index].ativo =false;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  changeState(item, categorias);
                                });

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
                        child: FutureBuilder<List<Comida>>(
                            future: controller.listComida(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: Column(children: <Widget>[
                                      Text('Carregando Itens'),
                                      CircularProgressIndicator()
                                    ]),
                                  );
                                  break;
                                case ConnectionState.active:
                                case ConnectionState.done:
                                  return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        List<Comida> listaComidasFirebase =
                                            snapshot.data;
                                        Comida comida =
                                            listaComidasFirebase[index];
                                        if(index % 2 == 0){
                                          comida.alinhamento = false;
                                        }
                                        return FoodItems(comida);
                                      });
                              }
                            })),
                  ]),
                )
              ],
            )),
      ],
    );
  }
}
