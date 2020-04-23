import 'package:mobx/mobx.dart';

import '../../repositories/lojista_repo_contracts.dart';

part 'lojista_controller.g.dart';

class LojistaController = _LojistaControllerBase with _$LojistaController;

abstract class _LojistaControllerBase with Store {

   final ILojistaRepo repository;

  _LojistaControllerBase(this.repository);

}
