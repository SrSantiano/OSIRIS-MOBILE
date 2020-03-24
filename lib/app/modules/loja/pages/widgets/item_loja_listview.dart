import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/pages/widgets/item_loja.dart';

class ItemLojaListView extends StatelessWidget {
  final Stream<QuerySnapshot> streamLojas;

  const ItemLojaListView({Key key, @required this.streamLojas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamLojas,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              physics: BouncingScrollPhysics(),
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return ItemLoja(
                  loja: Loja.fromDocument(document),
                );
              }).toList(),
            );
        }
      },
    );
  }
}

/* @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Loja>>(
      stream: streamLojas,
      builder: (BuildContext context, AsyncSnapshot<List<Loja>> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
                children: snapshot.data.map((value) {
              return new ItemLoja(
                loja: value,
              );
            }).toList());
        }
      },
    );
  } */
