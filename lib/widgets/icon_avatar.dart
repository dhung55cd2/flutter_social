import 'package:flutter/material.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/messenger/page_chats.dart';
import 'package:flutter_social/screen/screen_utils.dart';

class AvatarIcon extends StatelessWidget {
   String image;
   String subImage;
  @override
  Widget build(BuildContext context) {
    image = 'assets/images/own_avatar.png';
    subImage = 'assets/images/blur.png';
    return  Container(height: myHeight(51),width: myWidth(40),
      child: MaterialButton(padding: EdgeInsets.all(0),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageChats()));
        },
        child: Stack(
          children: [
            Positioned(bottom: 0,
                child: Container(height: myHeight(40),width: myWidth(40),
                    child: Image.asset(subImage))),
            Positioned(top: 0,
                child: Container(height: myHeight(40),width: myWidth(40),
                    child: Image.asset(image)))
          ],
        ),
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
class IconCallPage extends StatelessWidget {
  final String image;
  final Color color;

  const IconCallPage({Key key, this.image, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(56),width: myWidth(56),
    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),child: Image.asset(image,color: color,),);
  }
}


