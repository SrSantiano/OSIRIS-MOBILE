import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

part 'loja_repository_controller.g.dart';

class LojaRepositoryController = _LojaRepositoryControllerBase
    with _$LojaRepositoryController;

abstract class _LojaRepositoryControllerBase with Store {
  final ILojaRepository _lojaRepository = Modular.get();

  Stream<List<Loja>> getLojas() {
    return _lojaRepository.getLojas();
  }
}
