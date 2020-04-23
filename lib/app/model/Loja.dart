import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';

import 'rede_social.dart';
import 'tema.dart';
import 'usuario.dart';

class Loja extends Usuario {
  String uidLojista;
  String nomeFantasia;
  bool possuiLojaFisica;
  String categoriaPrimaria;
  String avaliacao;
  String imagemPerfil;
  String publicacaoImagemInicial;
  Tema tema;
  bool mostrarBebidasInicio;
  String tempoEntrega;
  Decimal taxaEntrega;
  bool estaAberto;
  bool pagamentoCartao;
  List<RedeSocial> redeSocial;

  Loja(
      {String nome,
      String email,
      String telefone1,
      String telefone2,
      this.uidLojista,
      this.nomeFantasia,
      this.possuiLojaFisica,
      this.categoriaPrimaria,
      this.avaliacao,
      this.imagemPerfil,
      this.mostrarBebidasInicio,
      this.publicacaoImagemInicial,
      this.tema,
      this.tempoEntrega,
      String taxaEntrega,
      this.estaAberto,
      this.pagamentoCartao,
      this.redeSocial})
      : taxaEntrega = Decimal.parse(taxaEntrega),
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
      uidLojista: doc.documentID,
      mostrarBebidasInicio: doc['mostrarBebidasInicio'] as bool,
      nomeFantasia: doc['nomeFantasia'] as String,
      possuiLojaFisica: doc['possuiLojaFisica'] as bool,
      categoriaPrimaria: doc['categoriaPrimaria'] as String,
      avaliacao: doc['avaliacao'] as String,
      imagemPerfil: doc['imagemPerfil'] as String,
      publicacaoImagemInicial: doc['publicacaoImagemInicial'] as String,
      tema: Tema.fromMap(doc['tema'] as Map<String, dynamic>),
      taxaEntrega: doc['taxaEntrega'] as String,
      estaAberto: doc['estaAberto'] as bool,
      redeSocial: (doc['redeSocial'] as List<dynamic>)
          .map<RedeSocial>((value) => RedeSocial.fromMap(value))
          .toList(),
      pagamentoCartao: doc['pagamentoCartao'] as bool,
      tempoEntrega: doc['tempoEntrega'] as String,
    );
  }
}
