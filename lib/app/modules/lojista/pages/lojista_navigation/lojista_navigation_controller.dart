import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/lojista/repositories/lojista_repo_contracts.dart';

part 'lojista_navigation_controller.g.dart';

class LojistaNavigationController = _LojistaNavigationControllerBase
    with _$LojistaNavigationController;

abstract class _LojistaNavigationControllerBase with Store {
  final ILojistaRepo repository;

  _LojistaNavigationControllerBase(ILojistaRepo this.repository);

}
