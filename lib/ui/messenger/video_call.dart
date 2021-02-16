import 'package:flutter/material.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';

class VideoCall extends StatelessWidget {
  final UserChat userChat;

  const VideoCall({Key key, this.userChat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: Container(height: size.height,width: size.width,
     child: Stack(
       children: [
         _background(userChat),
         Positioned(top: myHeight(74),left: myWidth(20),child: IconBack()),
         Positioned(top: myHeight(64),left: myWidth(315),child: AvatarIcon()),
         Positioned(top: myHeight(124),left: myWidth(255),child: _userVideo('assets/myimages/image2.jpg')),
         Positioned(top: myHeight(606),left: myWidth(80),
             child: Column(
           children: [
             _rowIcon(),
             SizedBox(height: myHeight(20),),
             _buildButton()
           ],
         )
        )

       ],
     ),),
    );
  }
  Widget _userVideo(String image){
    return Container(
      height: myHeight(153),width: myWidth(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(myRadius(10)),image: DecorationImage(image: AssetImage(image))
      ),
    );
  }
  Widget _buildButton(){
    return  CustomButon(height: 45,width: 215,nameButton: "END CALL",radius: 22.5,
      background: color_pink,textColor: Colors.white,textSize: 12,
      icon: Image.asset('assets/icons/end call.png',color: Colors.white,fit: BoxFit.cover,),
      onpress: (){
      },);
  }
  Widget _rowIcon() {
    return Container(height: myHeight(56),width: myWidth(140),
    child: Row(
      children: [
        IconCallPage(image: 'assets/icons/mute.png',color: textColor,),
        SizedBox(width: myWidth(24),),
        IconCallPage(image: 'assets/icons/videocam.png',color: textColor,)
      ],
    ),);
  }
  Widget _background(UserChat userChat){
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(userChat.avatar),fit: BoxFit.cover)),
    );
  }
}
