import 'package:decimal/decimal.dart';

class Peso {
  String peso;
  Decimal preco;

  Peso({this.peso, String preco}) : this.preco = Decimal.parse(preco);

  factory Peso.fromMap(Map<String, dynamic> map) {
    return Peso(
      peso: map['peso'] as String,
      preco: map['preco'] as String,
    );
  }
}
