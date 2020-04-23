enum TipoProdutoEnum {
  PRODALIMENTOUN,
  PRODALIMENTOTAM,
  PRODALIMENTOPES,
  PRODBEBIDAUN,
  PRODBEBIDATAM
}

abstract class Produto {
  String idProduto;
  String nome;
  String imagem;
  final List<String> _ingredientes;
  TipoProdutoEnum tipoProduto;

  Produto(
      {this.idProduto,
      this.nome,
      this.imagem,
      List<String> ingredientes,
      this.tipoProduto})
      : _ingredientes = ingredientes;

  String getIngredientes() {
    if (_ingredientes.length > 1) {
      return '${_ingredientes.getRange(0, _ingredientes.length - 1).join(', ')}'
          ' e ${_ingredientes.last}.';
    } else if (_ingredientes.length == 1) {
      return '${_ingredientes.first}.';
    } else {
      return '';
    }
  }
}
