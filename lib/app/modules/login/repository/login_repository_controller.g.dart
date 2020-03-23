// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginRepositoryController on _LoginRepositoryControllerBase, Store {
  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future<FirebaseUser> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$loginWithFacebookAsyncAction = AsyncAction('loginWithFacebook');

  @override
  Future<FirebaseUser> loginWithFacebook() {
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
    final string = '';
    return '{$string}';
  }
}
