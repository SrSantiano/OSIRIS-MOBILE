import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../model/iproduto.dart';
import '../../../../../model/produto_alimento_un.dart';
import '../../../../../model/produto_bebida_tam.dart';
import '../lojista_controller.dart';
import 'item_bebida_tam.dart';
import 'item_produto_un.dart';

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
    extends ModularState<StreamBuilderProduto, LojistaController>
    with AutomaticKeepAliveClientMixin {
  Stream<List<IProduto>> _streamProdutos;

  @override
  void initState() {
    _streamProdutos = controller.repository
        .getProdutos(widget.uidLojista, widget.idCategoria);
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return StreamBuilder<List<IProduto>>(
      stream: _streamProdutos,
      builder: (context, snapshot) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            switch (snapshot.data[index].runtimeType) {
              case ProdutoAlimentoUn:
                return ItemProdutoUn(
                  produtoUnidade: snapshot.data[index],
                  onPressed: () {
                    Modular.to
                        .pushNamed('/produto', arguments: snapshot.data[index]);
                  },
                );
              case ProdutoBebidaTam:
                return ItemBebidaTam(snapshot.data[index], widget.uidLojista,
                    widget.idCategoria);
              default:
                return null;
            }
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
