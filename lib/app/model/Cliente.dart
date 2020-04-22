import 'package:osiris/app/model/Usuario.dart';

class Cliente extends Usuario {
  String _uidCliente;
  int _dataNascimento;

  Cliente({
    String uidCliente,
    String nome,
      String email,
      int dataNascimento,
      String telefone1,
      String telefone2})
      :  _uidCliente = uidCliente,
  _dataNascimento = dataNascimento,
  super(nome: nome,
  email: email,
  telefone1: telefone1,
  telefone2: telefone2);
}
