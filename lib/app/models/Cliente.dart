import 'package:osiris/app/models/Usuario.dart';

class Cliente extends Usuario {
  String _uidCliente;
  int _dataNascimento;

  Cliente();

  Cliente.novoCliente(
      {String nome,
      String email,
      int dataNascimento,
      String telefone1,
      String telefone2})
      : super.novoUsuario(nome, email, telefone1, telefone2) {
    this._dataNascimento = dataNascimento;
  }
}
