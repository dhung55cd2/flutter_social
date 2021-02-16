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
  final Widget icon;
  final Function onpress;

  const CustomButon({Key key, this.height, this.width, this.nameButton, this.radius, this.background, this.textColor, this.textSize, this.icon, this.onpress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(padding: EdgeInsets.all(0),
      onPressed: onpress,
      child: Container(height: myHeight(height),width: myWidth(width),
      decoration: BoxDecoration(border: background == Colors.white ? Border.all(color: textColor):null,
      color: background, borderRadius: BorderRadius.circular(myRadius(radius))),
      child: MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null ? SizedBox(width: 0,) :
            Container(height: myHeight(20),width: myWidth(20),margin: EdgeInsets.only(right: myWidth(10)),child: icon),
            Text(nameButton,style: TextStyle(color: textColor,fontSize: mySize(textSize)),),
          ],
        ),
      ),),
    );
  }
}
