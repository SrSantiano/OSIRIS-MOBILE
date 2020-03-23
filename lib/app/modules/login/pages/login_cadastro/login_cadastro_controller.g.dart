// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginCadastroController on _LoginCadastroControllerBase, Store {
  final _$emailAtom = Atom(name: '_LoginCadastroControllerBase.email');

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

  final _$passwordAtom = Atom(name: '_LoginCadastroControllerBase.password');

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

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('registerWithEmailAndPassword');

  @override
  Future<void> registerWithEmailAndPassword() {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword());
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},password: ${password.toString()}';
    return '{$string}';
  }
}
