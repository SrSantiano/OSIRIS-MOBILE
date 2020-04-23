import 'usuario.dart';

class Cliente extends Usuario {
  String uidCliente;
  int dataNascimento;

  Cliente(
      {this.uidCliente,
      String nome,
      String email,
      this.dataNascimento,
      String telefone1,
      String telefone2})
      : super(
          nome: nome,
          email: email,
          telefone1: telefone1,
          telefone2: telefone2,
        );
}
