  import 'package:flutter/material.dart';

class PedidoPage extends StatefulWidget {
  final String title;
  const PedidoPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
