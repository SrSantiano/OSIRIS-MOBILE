// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entrar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginEntrarController on _LoginEntrarControllerBase, Store {
  final _$emailAtom = Atom(name: '_LoginEntrarControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginEntrarControllerBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$logadoAtom = Atom(name: '_LoginEntrarControllerBase.logado');

  @override
  bool get logado {
    _$logadoAtom.context.enforceReadPolicy(_$logadoAtom);
    _$logadoAtom.reportObserved();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.context.conditionallyRunInAction(() {
      super.logado = value;
      _$logadoAtom.reportChanged();
    }, _$logadoAtom, name: '${_$logadoAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_LoginEntrarControllerBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$loginWithEmailAndPasswordAsyncAction =
      AsyncAction('loginWithEmailAndPassword');

  @override
  Future<void> loginWithEmailAndPassword() {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword());
  }

  final _$loginWithFacebookAsyncAction = AsyncAction('loginWithFacebook');

  @override
  Future<void> loginWithFacebook() {
    return _$loginWithFacebookAsyncAction.run(() => super.loginWithFacebook());
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future<dynamic> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$logoAsyncAction = AsyncAction('logo');

  @override
  Future<dynamic> logo() {
    return _$logoAsyncAction.run(() => super.logo());
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},password: ${password.toString()},logado: ${logado.toString()},user: ${user.toString()}';
    return '{$string}';
  }
}
