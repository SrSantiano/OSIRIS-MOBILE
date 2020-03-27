import 'package:flutter/material.dart';
import 'package:osiris/app/data/data-test.dart';
import 'package:osiris/app/models/Comida.dart';

class FoodDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comida = ModalRoute.of(context).settings.arguments as Comida;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_shopping_cart,
        ),
        backgroundColor: Colors.amber,
      ),
      appBar: AppBar(
        title: Text(comida.nome),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: comida.id,
            child: Stack(
              children: <Widget>[
                Container(
                    height: 300,
                    width: 500,
                    color: Colors.yellow,
                    child: Image.network(
                      comida.imagem,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 5,
                  child: Container(
                    color: Colors.black87,
                    height: 50,
                    width: 150,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
