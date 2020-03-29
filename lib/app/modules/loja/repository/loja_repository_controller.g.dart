// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loja_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LojaRepositoryController on _LojaRepositoryControllerBase, Store {
  final _$uidLojistaAtom =
      Atom(name: '_LojaRepositoryControllerBase.uidLojista');

  @override
  String get uidLojista {
    _$uidLojistaAtom.context.enforceReadPolicy(_$uidLojistaAtom);
    _$uidLojistaAtom.reportObserved();
    return super.uidLojista;
  }

  @override
  set uidLojista(String value) {
    _$uidLojistaAtom.context.conditionallyRunInAction(() {
      super.uidLojista = value;
      _$uidLojistaAtom.reportChanged();
    }, _$uidLojistaAtom, name: '${_$uidLojistaAtom.name}_set');
  }

  final _$idCategoriaAtom =
      Atom(name: '_LojaRepositoryControllerBase.idCategoria');

  @override
  List<String> get idCategoria {
    _$idCategoriaAtom.context.enforceReadPolicy(_$idCategoriaAtom);
    _$idCategoriaAtom.reportObserved();
    return super.idCategoria;
  }

  @override
  set idCategoria(List<String> value) {
    _$idCategoriaAtom.context.conditionallyRunInAction(() {
      super.idCategoria = value;
      _$idCategoriaAtom.reportChanged();
    }, _$idCategoriaAtom, name: '${_$idCategoriaAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'uidLojista: ${uidLojista.toString()},idCategoria: ${idCategoria.toString()}';
    return '{$string}';
  }
}
