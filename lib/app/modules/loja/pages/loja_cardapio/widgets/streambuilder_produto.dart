import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';
import 'package:osiris/app/modules/loja/pages/loja_cardapio/widgets/item_produto_un.dart';
import 'package:osiris/app/modules/loja/pages/loja_page/loja_page_controller.dart';

class StreamBuilderProduto extends StatefulWidget {
  final String uidLojista;
  final String idCategoria;

  const StreamBuilderProduto({
    Key key,
    @required this.uidLojista,
    @required this.idCategoria,
  }) : super(key: key);

  @override
  _StreamBuilderProdutoState createState() => _StreamBuilderProdutoState();
}

class _StreamBuilderProdutoState
    extends ModularState<StreamBuilderProduto, LojaPageController>
    with AutomaticKeepAliveClientMixin {
  Stream<List<ProdutoUnidade>> streamProduto;

  @override
  void initState() {
    streamProduto = controller.repository
        .getProdutos(widget.uidLojista, widget.idCategoria);
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProdutoUnidade>>(
      stream: streamProduto,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        return Container(
          color: Colors.white,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return new ItemProdutoUn(
                produtoUnidade: snapshot.data[index],
              );
            },
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
