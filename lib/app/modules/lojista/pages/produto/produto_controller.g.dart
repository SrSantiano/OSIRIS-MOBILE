// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
  final _$qtdeAtom = Atom(name: '_ProdutoControllerBase.qtde');

  @override
  int get qtde {
    _$qtdeAtom.context.enforceReadPolicy(_$qtdeAtom);
    _$qtdeAtom.reportObserved();
    return super.qtde;
  }

  @override
  set qtde(int value) {
    _$qtdeAtom.context.conditionallyRunInAction(() {
      super.qtde = value;
      _$qtdeAtom.reportChanged();
    }, _$qtdeAtom, name: '${_$qtdeAtom.name}_set');
  }

  final _$currentPositionAtom =
      Atom(name: '_ProdutoControllerBase.currentPosition');

  @override
  int get currentPosition {
    _$currentPositionAtom.context.enforceReadPolicy(_$currentPositionAtom);
    _$currentPositionAtom.reportObserved();
    return super.currentPosition;
  }

  @override
  set currentPosition(int value) {
    _$currentPositionAtom.context.conditionallyRunInAction(() {
      super.currentPosition = value;
      _$currentPositionAtom.reportChanged();
    }, _$currentPositionAtom, name: '${_$currentPositionAtom.name}_set');
  }

  final _$observacoesAtom = Atom(name: '_ProdutoControllerBase.observacoes');

  @override
  List<String> get observacoes {
    _$observacoesAtom.context.enforceReadPolicy(_$observacoesAtom);
    _$observacoesAtom.reportObserved();
    return super.observacoes;
  }

  @override
  set observacoes(List<String> value) {
    _$observacoesAtom.context.conditionallyRunInAction(() {
      super.observacoes = value;
      _$observacoesAtom.reportChanged();
    }, _$observacoesAtom, name: '${_$observacoesAtom.name}_set');
  }

  final _$_ProdutoControllerBaseActionController =
      ActionController(name: '_ProdutoControllerBase');

  @override
  void setQtde(int n) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.setQtde(n);
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTamObservacoes(int tam) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.setTamObservacoes(tam);
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'qtde: ${qtde.toString()},currentPosition: ${currentPosition.toString()},observacoes: ${observacoes.toString()}';
    return '{$string}';
  }
}
