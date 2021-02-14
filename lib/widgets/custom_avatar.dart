import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class CustomAvatar extends StatelessWidget {
  final double insideradius;
  final double outsideradius;
  final String images;

  const CustomAvatar({Key key, this.insideradius, this.outsideradius, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(offset: Offset(1,1), blurRadius: myRadius(10),color: Colors.grey[400])
      ]),
      child: CircleAvatar(
        radius: myHeight(outsideradius),
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: myHeight(insideradius),
          backgroundImage: AssetImage(images)
        ),
      ),
    ); ;
  }
}
