import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Usuario {
  String nome;
  String email;
  bool usuarioAtivo;
  int dataHoraCadastro;
  String telefone1;
  String telefone2;

  Usuario();

  Usuario.novoUsuario(this.nome, this.email, this.telefone1, this.telefone2) {
    this.usuarioAtivo = true;
    this.dataHoraCadastro = Timestamp.now().seconds;
  }
}
