// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedControllerBase, Store {
  final _$comidasAtom = Atom(name: '_FeedControllerBase.comidas');

  @override
  List<Comida> get comidas {
    _$comidasAtom.context.enforceReadPolicy(_$comidasAtom);
    _$comidasAtom.reportObserved();
    return super.comidas;
  }

  @override
  set comidas(List<Comida> value) {
    _$comidasAtom.context.conditionallyRunInAction(() {
      super.comidas = value;
      _$comidasAtom.reportChanged();
    }, _$comidasAtom, name: '${_$comidasAtom.name}_set');
  }

  final _$listComidaAsyncAction = AsyncAction('listComida');

  @override
  Future<List<Comida>> listComida() {
    return _$listComidaAsyncAction.run(() => super.listComida());
  }

  @override
  String toString() {
    final string = 'comidas: ${comidas.toString()}';
    return '{$string}';
  }
}
