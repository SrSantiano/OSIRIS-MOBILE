import 'package:osiris/app/models/loja.dart';
import 'package:osiris/app/models/Loja.dart';

class Food {
  final Loja empresa;
  final String name;
  final String imageUrl;
  final String description;
  final double valor;
  final String carne;
  final double avaliacao;
  final int id;

  Food({
    this.empresa,
    this.name,
    this.imageUrl,
    this.description,
    this.valor,
    this.carne,
    this.avaliacao,
    this.id,
  });
}

var empresas =[
  Loja(
    nomeFantasia: 'Total burguer',
    imagemPerfil: 'assets/images/empresa.png',
    bio:
        'Empresa especializada em Hamburguer laralalalala lalalala allalalal alalalalal allalalallal lalalalal'),
  
  Loja(
    name: 'Quintal Burguer',
    imageUrl: 'assets/images/empresa.png',
    bio:
        'mpresa especializada em Hamburguer laralalalala lalalala allalalal alalalalal allalalallal lalalalal')
];


List<Food> foods = [
  Food(
    empresa: empresas[0],
    name: 'Bacon Duplo',
    imageUrl: 'assets/images/bacon.jpg',
    description: 'Hamburguer, Queijo, Bacon, Molho especial',
    valor: 20.0,
    carne: 'Bovina',
    avaliacao: 4.6,
    id: 12345,
  ),
  Food(
    empresa: empresas[1],
    name: 'Smash',
    imageUrl: 'assets/images/smash.jpg',
    description: 'Outros ingredientes especiais',
    valor: 18.5,
    carne: 'bovina',
    avaliacao: 4.8,
    id: 98765,
  ),
];
