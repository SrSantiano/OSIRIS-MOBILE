import 'package:flutter/cupertino.dart';
import 'package:osiris/app/models/Categorias.dart';
import 'package:osiris/app/models/Comida.dart';
import 'package:osiris/app/models/Loja.dart';
import 'package:flutter/material.dart';

var comidas = [
  Comida(
    loja: lojas[0],
    nome: 'Bacon Duplo',
    price: 20.0,
    imagem: 'https://valenews.com.br/wp-content/uploads/2019/12/FestivalBurguer-e-BeerShoppingJdOriente13122019.jpg',
    avaliacao: 4.7,
   
    ///alinhamento: true
  ),
  Comida(
    loja: lojas[1],
    nome: 'Smash',
    price: 18.0,
    imagem: 'https://valenews.com.br/wp-content/uploads/2019/12/FestivalBurguer-e-BeerShoppingJdOriente13122019.jpg',
    avaliacao: 4.5,
    
   // alinhamento: false
  ),
  Comida(
    loja: lojas[1],
    nome: 'Smash',
    price: 18.0,
    imagem: 'https://valenews.com.br/wp-content/uploads/2019/12/FestivalBurguer-e-BeerShoppingJdOriente13122019.jpg',
    avaliacao: 4.5,
    
   // alinhamento: true
  ),
  Comida(
    loja: lojas[1],
    nome: 'Smash',
    price: 18.0,
    imagem: 'https://valenews.com.br/wp-content/uploads/2019/12/FestivalBurguer-e-BeerShoppingJdOriente13122019.jpg',
    avaliacao: 4.5,
   
   // alinhamento: false
  ),
  Comida(
    loja: lojas[1],
    nome: 'Smash',
    price: 18.0,
    imagem: 'https://valenews.com.br/wp-content/uploads/2019/12/FestivalBurguer-e-BeerShoppingJdOriente13122019.jpg',
    avaliacao: 4.5,
  
   // alinhamento: true
  ),
  Comida(
    loja: lojas[0],
    nome: 'Jessica Beppler',
    price: 200.0,
    imagem: 'https://i.ytimg.com/vi/xXS47doWa3Y/maxresdefault.jpg',
    avaliacao: 2.9,
   
   // alinhamento: false
  ),

  

];

List<Loja> lojas = [
  Loja(
    nomeFantasia: 'Quintal Burguer',
    imagemPerfil: '/assets/dragons-crown-characters-800x449.jpg'
  ),
  Loja(
    nomeFantasia: 'Ipê Burguer',
    imagemPerfil: '/assets/dragons-crown-characters-800x449.jpg'
  ),

];


var categorias = [
  Categoria(
    nome: 'Hamburguer',
    icon: Icon(Icons.fastfood),
    quantidade: 10,
    ativo: true
  ),
  Categoria(
    nome: 'Pizza',
    icon: Icon(Icons.fastfood),
    quantidade: 10,
    ativo: false
  ),
  Categoria(
    nome: 'Jantinha',
    icon: Icon(Icons.fastfood),
    quantidade: 10,
    ativo: false
  ),
  Categoria(
    nome: 'Milkshake',
    icon: Icon(Icons.fastfood),
    quantidade: 10,
    ativo: false
  ),
  Categoria(
    nome: 'Cerveja',
    icon: Icon(Icons.fastfood),
    quantidade: 10,
    ativo: false
  ),
  
];