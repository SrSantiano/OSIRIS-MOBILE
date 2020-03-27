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
      
      body: Column(
        children: <Widget>[
          Hero(
            tag: comida.id,
            child: Stack(
              children: <Widget>[
                Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.yellow,
                    child:  Image.network(
                        comida.imagem,
                        fit: BoxFit.cover,
                      ),
                    ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    color: Colors.black38,
                    height: 50,
                    width: 410,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          comida.nome,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,

                          ),
                          )
                      ]
                    )
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
