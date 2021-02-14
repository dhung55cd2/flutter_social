import 'package:flutter/material.dart';
import 'package:flutter_social/utils/colors.dart';

class CustomIcon extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final Color color;

  const CustomIcon({Key key, this.height, this.width, this.image, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: height,width: width,
      child: Image.asset(image,color: color,));
  }
}
