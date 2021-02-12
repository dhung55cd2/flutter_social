import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';

class CustomButon extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String nameButton;
  final Color background;
  final Color textColor;
  final double textSize;

  const CustomButon({Key key, this.height, this.width, this.nameButton, this.radius, this.background, this.textColor, this.textSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(height),width: myWidth(width),
    decoration: BoxDecoration(border: background == Colors.white ? Border.all(color: textColor):null,
    color: background, borderRadius: BorderRadius.circular(myRadius(radius))),
    child: MaterialButton(
      child: Text(nameButton,style: TextStyle(color: textColor,fontSize: mySize(textSize)),),
    ),);
  }
}
