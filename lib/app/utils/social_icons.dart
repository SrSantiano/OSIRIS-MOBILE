import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {

  List<Color> colors;
  Image icon;
  Function onPressed;
  SocialIcon({this.colors, this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 14.0, right: 14.0,),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            ),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }
}