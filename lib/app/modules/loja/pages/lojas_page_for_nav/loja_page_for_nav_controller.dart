import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';

part 'loja_page_for_nav_controller.g.dart';

class LojaPageForNavController = _LojaPageForNavControllerBase
    with _$LojaPageForNavController;
    
abstract class _LojaPageForNavControllerBase with Store {
  final ILojaRepository repository;

  _LojaPageForNavControllerBase(ILojaRepository this.repository);
}
