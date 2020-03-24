import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_contracts.dart';
import 'package:osiris/app/modules/loja/repository/loja_repository_controller.dart';

part 'loja_page_controller.g.dart';

class LojaPageController = _LojaPageControllerBase with _$LojaPageController;

abstract class _LojaPageControllerBase with Store {
  @observable
  ObservableStream<List<Loja>> lojas;

  //final LojaRepositoryController lojaRepositoryController;
  final ILojaRepository repository;

  _LojaPageControllerBase(ILojaRepository this.repository){
    getLojas();
  }

  @action
  getLojas() {
    lojas = repository.getLojas().asObservable();
  }

  Stream<QuerySnapshot> getLojasStream(){
    return repository.getLojasStream();
  }
}
