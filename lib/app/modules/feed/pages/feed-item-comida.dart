import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/models/Comida.dart';

class FoodItems extends StatelessWidget {
  
  final Comida comida;
  const FoodItems(this.comida);


  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return InkWell(
      onTap: (){
       
      },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: comida.alinhamento ? 0 : containerPadding,
                right: comida.alinhamento ? containerPadding : 0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: comida.alinhamento
                            ? Radius.circular(0)
                            : Radius.circular(containerBorderRadius),
                        right: comida.alinhamento
                            ? Radius.circular(containerBorderRadius)
                            : Radius.circular(0),
                      ),
                      child: InkWell(
                        onTap: (){
                          Modular.to.pushNamed('/FoodDetails', arguments: comida);
                        },
                        child: 
                           Hero(
                             tag: comida.id,
                             child: Container(
                              child: Image.network(
                                comida.imagem,
                                fit: BoxFit.cover,
                              ),
                          ),
                           ),
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.only(
                        left: comida.alinhamento ? 20 : 0,
                        right: comida.alinhamento ? 0 : 20,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(comida.nome,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      )),
                                ),
                                Text('R\$ ' + comida.price.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )),
                              ],
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                    children: [
                                      TextSpan(text: "Fornecido por: " ),
                                      TextSpan(
                                          text: comida.loja.nome,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700))
                                    ]),
                              ),
                            ),
                            SizedBox(height: containerPadding),
                          ])),
                ],
              ),
            )
          ],
        ),
      
    );
  }
}