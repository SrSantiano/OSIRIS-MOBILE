class TemaBebida {
  String corPrimaria;
  String corSecundaria;
  String corTexto;

  TemaBebida({this.corPrimaria, this.corSecundaria, this.corTexto});

  factory TemaBebida.fromMap(Map<String, dynamic> map) {
    return TemaBebida(
      corPrimaria: map['corPrimaria'] as String,
      corSecundaria: map['corSecundaria'] as String,
      corTexto: map['corTexto'] as String,
    );
  }
}
