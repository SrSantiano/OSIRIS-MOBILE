// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loja_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LojaPageController on _LojaPageControllerBase, Store {
  final _$pageControllerAtom =
      Atom(name: '_LojaPageControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.context.enforceReadPolicy(_$pageControllerAtom);
    _$pageControllerAtom.reportObserved();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.context.conditionallyRunInAction(() {
      super.pageController = value;
      _$pageControllerAtom.reportChanged();
    }, _$pageControllerAtom, name: '${_$pageControllerAtom.name}_set');
  }

  final _$produtoUnidadeAtom =
      Atom(name: '_LojaPageControllerBase.produtoUnidade');

  @override
  ProdutoUnidade get produtoUnidade {
    _$produtoUnidadeAtom.context.enforceReadPolicy(_$produtoUnidadeAtom);
    _$produtoUnidadeAtom.reportObserved();
    return super.produtoUnidade;
  }

  @override
  set produtoUnidade(ProdutoUnidade value) {
    _$produtoUnidadeAtom.context.conditionallyRunInAction(() {
      super.produtoUnidade = value;
      _$produtoUnidadeAtom.reportChanged();
    }, _$produtoUnidadeAtom, name: '${_$produtoUnidadeAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'pageController: ${pageController.toString()},produtoUnidade: ${produtoUnidade.toString()}';
    return '{$string}';
  }
}
