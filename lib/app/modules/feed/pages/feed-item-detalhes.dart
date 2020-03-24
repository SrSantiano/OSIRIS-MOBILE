import 'package:flutter/material.dart';
import 'package:osiris/app/models/Comida.dart';

class FoodDetails extends StatefulWidget {
  
  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          
             Hero(
               tag: ,
               child: Container(
                height: 300,
                width: 500,
                color: Colors.yellow,
                child: Image.network('https://moonbh.com.br/wp-content/uploads/2018/09/promo%C3%A7%C3%A3o-codigo-rappi.jpg', fit: BoxFit.cover,)
            ),
             ),
         
        ],
      ),
      
    );
  }
}