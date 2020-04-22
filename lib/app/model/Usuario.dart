import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class Usuario {

  @protected
  String nome;
  @protected
  String email;
  @protected
  bool usuarioAtivo;
  @protected
  String dataHoraCadastro;
  @protected
  String telefone1;
  @protected
  String telefone2;

  //Endereço
  Usuario({this.nome, this.email, this.telefone1, this.telefone2})
      : usuarioAtivo = true,
        dataHoraCadastro = Timestamp.now().seconds.toString();
}
