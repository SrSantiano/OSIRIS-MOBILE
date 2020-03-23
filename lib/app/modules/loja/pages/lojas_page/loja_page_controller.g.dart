// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loja_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LojaPageController on _LojaPageControllerBase, Store {
  final _$lojasAtom = Atom(name: '_LojaPageControllerBase.lojas');

  @override
  ObservableStream<List<Loja>> get lojas {
    _$lojasAtom.context.enforceReadPolicy(_$lojasAtom);
    _$lojasAtom.reportObserved();
    return super.lojas;
  }

  @override
  set lojas(ObservableStream<List<Loja>> value) {
    _$lojasAtom.context.conditionallyRunInAction(() {
      super.lojas = value;
      _$lojasAtom.reportChanged();
    }, _$lojasAtom, name: '${_$lojasAtom.name}_set');
  }

  final _$_LojaPageControllerBaseActionController =
      ActionController(name: '_LojaPageControllerBase');

  @override
  dynamic getLojas() {
    final _$actionInfo =
        _$_LojaPageControllerBaseActionController.startAction();
    try {
      return super.getLojas();
    } finally {
      _$_LojaPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'lojas: ${lojas.toString()}';
    return '{$string}';
  }
}
