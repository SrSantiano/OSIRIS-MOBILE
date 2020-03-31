import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

part 'loja_page_controller.g.dart';

class LojaPageController = _LojaPageControllerBase with _$LojaPageController;

abstract class _LojaPageControllerBase with Store {
  final ILojaRepository repository;

  _LojaPageControllerBase(ILojaRepository this.repository);

}
