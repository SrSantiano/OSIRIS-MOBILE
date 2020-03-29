import 'package:mobx/mobx.dart';

part 'loja_repository_controller.g.dart';

class LojaRepositoryController = _LojaRepositoryControllerBase
    with _$LojaRepositoryController;

abstract class _LojaRepositoryControllerBase with Store {

  
  @observable
  String uidLojista;

  @observable
  List<String> idCategoria;

  
}
