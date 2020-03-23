import 'package:flutter/foundation.dart';

import 'RedeSocialEnum.dart';

class RedeSocial {
  RedeSocialEnum redeSocial;
  String link;
  String perfil;

  RedeSocial({this.redeSocial, this.link, this.perfil});

  RedeSocial.fromDoc(List<dynamic> list){
    list.forEach((map) {
      return RedeSocial(
        redeSocial: RedeSocialEnum.values.firstWhere((e) => describeEnum(e) == map['redeSocial']),
        perfil: map['perfil'],
        link: map['link'],
      );
    });
  }
}
