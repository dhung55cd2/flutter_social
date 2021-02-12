import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';

class AvatarIcon extends StatelessWidget {
   String image;
   String subImage;
  @override
  Widget build(BuildContext context) {
    image = 'assets/images/own_avatar.png';
    subImage = 'assets/images/blur.png';
    return  Container(height: myHeight(51),width: myWidth(40),
      child: Stack(
        children: [
          Positioned(bottom: 0,
              child: Container(height: myHeight(40),width: myWidth(40),
                  child: Image.asset(subImage))),
          Positioned(top: 0,
              child: Container(height: myHeight(40),width: myWidth(40),
                  child: Image.asset(image)))
        ],
      ),);
  }
}
class IconBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){Navigator.of(context).pop();},
      child: Container(height: myHeight(14),width: myWidth(20),
        child: Image.asset('assets/icons/back_arrow.png'),
      ),
    );
  }
}

