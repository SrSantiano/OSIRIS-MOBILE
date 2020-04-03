import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/models/ProdutoUnidade.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

part 'loja_page_controller.g.dart';

class LojaPageController = _LojaPageControllerBase with _$LojaPageController;

abstract class _LojaPageControllerBase with Store {
  final ILojaRepository repository;

  @observable
  PageController pageController = PageController(initialPage: 0);

  @observable
  ProdutoUnidade produtoUnidade;

  _LojaPageControllerBase(ILojaRepository this.repository);

  Future<bool> onBackPressed() async {
    if (pageController.page == 1) {
      pageController
          .previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ).whenComplete(() {
        produtoUnidade = null;
      });
      return false;
    } else {
      return true;
    }
  }
}
