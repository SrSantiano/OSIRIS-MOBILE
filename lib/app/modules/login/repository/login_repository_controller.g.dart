// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginRepositoryController on _LoginRepositoryControllerBase, Store {
  final _$userAtom = Atom(name: '_LoginRepositoryControllerBase.user');

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

  final _$statusAtom = Atom(name: '_LoginRepositoryControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$loginWithFacebookAsyncAction = AsyncAction('loginWithFacebook');

  @override
  Future<dynamic> loginWithFacebook() {
    return _$loginWithFacebookAsyncAction.run(() => super.loginWithFacebook());
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future<FirebaseUser> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_LoginRepositoryControllerBaseActionController =
      ActionController(name: '_LoginRepositoryControllerBase');

  @override
  dynamic setUser(FirebaseUser value) {
    final _$actionInfo =
        _$_LoginRepositoryControllerBaseActionController.startAction();
    try {
      return super.setUser(value);
    } finally {
      _$_LoginRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> logOut() {
    final _$actionInfo =
        _$_LoginRepositoryControllerBaseActionController.startAction();
    try {
      return super.logOut();
    } finally {
      _$_LoginRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'user: ${user.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
