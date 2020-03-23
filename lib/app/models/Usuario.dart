import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class Usuario {

  String nome;

  String email;

  bool usuarioAtivo;

  String dataHoraCadastro;

  String telefone1;

  String telefone2;

  //Endereço


  Usuario({this.nome, this.email, this.telefone1, this.telefone2})
      : usuarioAtivo = true,
        dataHoraCadastro = Timestamp.now().seconds.toString();
}
