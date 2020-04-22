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
  List<String> _ingredientes;
  TipoProdutoEnum tipoProduto;

  Produto(
      {this.idProduto,
      this.nome,
      this.imagem,
      List<String> ingredientes,
      this.tipoProduto})
      : _ingredientes = ingredientes;

  String getIngredientes() {
    if (this._ingredientes.length > 1)
      return '${this._ingredientes.getRange(0, this._ingredientes.length - 1).join(', ')}' +
          ' e ${this._ingredientes.last}.';
    else if (this._ingredientes.length == 1)
      return this._ingredientes.first + '.';
    else
      return '';
  }
}
