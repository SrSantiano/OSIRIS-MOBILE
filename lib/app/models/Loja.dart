import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:osiris/app/models/Usuario.dart';
import 'RedeSocial.dart';
import 'Tema.dart';

class Loja extends Usuario {
  String _uidLojista;
  String _nomeFantasia;
  bool _possuiLojaFisica;
  String _categoriaPrimaria;
  String _avaliacao;
  String _imagemPerfil;
  String _publicacaoImagemInicial;
  Tema _tema;
  String _tempoEntrega;
  Decimal _taxaEntrega;
  bool _estaAberto;
  bool _pagamentoCartao;
  List<RedeSocial> _redeSocial;

  Loja(
      {String nome,
      String email,
      //bool usuarioAtivo, //será??
      //String dataHoraCadastro,
      String telefone1,
      String telefone2,
      String uidLojista,
      String nomeFantasia,
      bool possuiLojaFisica,
      String categoriaPrimaria,
      String avaliacao,
      String imagemPerfil,
      String publicacaoImagemInicial,
      Tema tema,
      String tempoEntrega,
      String taxaEntrega,
      bool estaAberto,
      bool pagamentoCartao,
      List<RedeSocial> redeSocial})
      : _uidLojista = uidLojista,
        _nomeFantasia = nomeFantasia,
        _possuiLojaFisica = possuiLojaFisica,
        _categoriaPrimaria = categoriaPrimaria,
        _avaliacao = avaliacao,
        _imagemPerfil = imagemPerfil,
        _publicacaoImagemInicial = publicacaoImagemInicial,
        _tema = tema,
        _taxaEntrega = Decimal.parse(taxaEntrega),
        _estaAberto = estaAberto,
        _pagamentoCartao = pagamentoCartao,
        _redeSocial = redeSocial,
        super(
            nome: nome,
            email: email,
            telefone1: telefone1,
            telefone2: telefone2);

  factory Loja.fromDocument(DocumentSnapshot doc) {
    return Loja(
      nome: doc['nome'] as String,
      email: doc['email'] as String,
      telefone1: doc['telefone1'] as String,
      telefone2: doc['telefone2'] as String,
      uidLojista: doc['uidLojista'] as String,
      nomeFantasia: doc['nomeFantasia'] as String,
      possuiLojaFisica: doc['possuiLojaFisica'] as bool,
      categoriaPrimaria: doc['categoriaPrimaria'] as String,
      avaliacao: doc['avaliacao'] as String,
      imagemPerfil: doc['imagemPerfil'] as String,
      publicacaoImagemInicial: doc['publicacaoImagemInicial'] as String,
      tema: Tema.fromMap(doc['tema'] as Map<String, dynamic>),
      taxaEntrega: doc['taxaEntrega'] as String ,
      estaAberto: doc['estaAberto'] as bool,
      redeSocial: (doc['redeSocial'] as List<dynamic>).map<RedeSocial>((value) => RedeSocial.fromMap(value)).toList(),
      pagamentoCartao: doc['pagamentoCartao'] as bool,
      tempoEntrega: doc['tempoEntrega'] as String,
    );

  }

  Tema get tema => this._tema;
  String get publicacaoImagemInicial => this._publicacaoImagemInicial;
  String get imagemPerfil => this._imagemPerfil;
  String get nomeFantasia => this._nomeFantasia;
  String get categoriaPrimaria => this._categoriaPrimaria;
  List<RedeSocial> get redeSocial => _redeSocial;
}
