class Tema {
  String corTextoTitulo;
  String corPrimaria;
  String corPrimariaLight;
  String corPrimariaDark;
  String corTextoPrimario;
  String corSecundaria;
  String corSecundariaLight;
  String corSecundariaDark;
  String corTextoSecundario;

  Tema({
    this.corTextoTitulo,
    this.corPrimaria,
    this.corPrimariaDark,
    this.corPrimariaLight,
    this.corTextoPrimario,
    this.corSecundaria,
    this.corSecundariaDark,
    this.corSecundariaLight,
    this.corTextoSecundario,
  });

  Tema.fromMap(Map<String, dynamic> map)
      : corTextoTitulo = map['corTextoTitulo'],
        corPrimaria = map['corPrimaria'],
        corPrimariaDark = map['corPrimariaDark'],
        corPrimariaLight = map['corPrimariaDark'],
        corTextoPrimario = map['corTextoPrimario'],
        corSecundaria = map['corSecundaria'],
        corSecundariaDark = map['corSecundariaDark'],
        corSecundariaLight = map['corSecundariaLight'],
        corTextoSecundario = map['corTextoSecundario'];
}
