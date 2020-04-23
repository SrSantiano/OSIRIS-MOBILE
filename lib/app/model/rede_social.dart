import 'package:flutter/foundation.dart';
import 'rede_social_enum.dart';

class RedeSocial {
  RedeSocialEnum redeSocial;
  String link;
  String perfil;

  RedeSocial({this.redeSocial, this.link, this.perfil});

  factory RedeSocial.fromMap(Map<String, dynamic> map) {
    return RedeSocial(
      redeSocial: RedeSocialEnum.values.firstWhere((e) => describeEnum(e) == map['redeSocial']),
      perfil: map['perfil'] as String,
      link: map['link'] as String,
    );
  }
}