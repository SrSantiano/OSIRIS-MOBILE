// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loja_cardapio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LojaCardapioController on _LojaCardapioControllerBase, Store {
  final _$streamListCategoriaAtom =
      Atom(name: '_LojaCardapioControllerBase.streamListCategoria');

  @override
  ObservableStream<List<Categoria>> get streamListCategoria {
    _$streamListCategoriaAtom.context
        .enforceReadPolicy(_$streamListCategoriaAtom);
    _$streamListCategoriaAtom.reportObserved();
    return super.streamListCategoria;
  }

  @override
  set streamListCategoria(ObservableStream<List<Categoria>> value) {
    _$streamListCategoriaAtom.context.conditionallyRunInAction(() {
      super.streamListCategoria = value;
      _$streamListCategoriaAtom.reportChanged();
    }, _$streamListCategoriaAtom,
        name: '${_$streamListCategoriaAtom.name}_set');
  }

  final _$_LojaCardapioControllerBaseActionController =
      ActionController(name: '_LojaCardapioControllerBase');

  @override
  dynamic getListCategorias() {
    final _$actionInfo =
        _$_LojaCardapioControllerBaseActionController.startAction();
    try {
      return super.getListCategorias();
    } finally {
      _$_LojaCardapioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'streamListCategoria: ${streamListCategoria.toString()}';
    return '{$string}';
  }
}
