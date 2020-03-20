import 'package:decimal/decimal.dart';
import 'package:osiris/app/models/Usuario.dart';
import 'RedeSocial.dart';
import 'Tema.dart';

class Loja extends Usuario{
  String _uidLojista;
  String _nomeFantasia;
  bool _possuiLojaFisica;
  String _categoriaPrimaria;
  double _avaliacao;
  String _imagemPerfil;
  List<String> _publicacaoImagemInicial;
  Tema _tema;
  String tempoEntrega;
  Decimal _taxaEntrega;
  bool _estaAberto;
  bool _pagamentoCartao;
  List<RedeSocial> _redeSocial;

  Loja();
}