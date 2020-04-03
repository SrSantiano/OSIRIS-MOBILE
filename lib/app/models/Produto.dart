import 'package:flutter/material.dart';

import 'TipoProdutoEnum.dart';

abstract class Produto {
  @protected
  String idProduto;
  @protected
  String nome;
  @protected
  String imagem;
  @protected
  List<String> ingredientes;
  @protected
  TipoProdutoEnum tipoProduto;

  @protected
  Produto(
      {this.idProduto,
      this.nome,
      this.imagem,
      this.ingredientes,
      this.tipoProduto});

  @protected
  String getIngredientes() {
    if (this.ingredientes.length > 1) {
      return '${this.ingredientes.getRange(0, this.ingredientes.length - 1).join(', ')}' +
          ' e ${this.ingredientes.getRange(this.ingredientes.length - 1, this.ingredientes.length).first}.';
    } else if (this.ingredientes.length == 1) {
      return this.ingredientes.first + '.';
    } else {
      return '';
    }
  }
}