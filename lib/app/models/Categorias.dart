import 'package:flutter/material.dart';

class Categoria {
  String nome;
  Icon icon;
  int quantidade;
  bool ativo =false;

  Categoria({
    this.nome,
    this.icon,
    this.quantidade,
    this.ativo
  });
}