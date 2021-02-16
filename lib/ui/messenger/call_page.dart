import 'package:flutter/material.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/messenger/video_call.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/build_custom_icon.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';

class CallPage extends StatefulWidget {
  final UserChat userChat;

  const CallPage({Key key, this.userChat}) : super(key: key);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,width: size.width,
        child: Column(
          children: [
            _buildAppBar(size),
            _buildAvatarCall(widget.userChat),
            SizedBox(height: myHeight(30),),
            Text(widget.userChat.name,style: TextStyle(color: textColor, fontSize: mySize(22)),),
            SizedBox(height: myHeight(2),),
            Text('taikhoancuanguoigoi@gmail.com',style: TextStyle(color: subtextColor, fontSize: mySize(12))),
            SizedBox(height: myHeight(18),),
            Text("2:30",style: TextStyle(color: textColor, fontSize: mySize(14)),),
            SizedBox(height: myHeight(90),),
            _buildRowIcon(),
            SizedBox(height: myHeight(80),),
            CustomButon(height: 45,width: 215,nameButton: "END CALL",radius: 22.5,background: color_pink,textColor: Colors.white,textSize: 12,
            icon: Image.asset('assets/icons/end call.png',color: Colors.white,fit: BoxFit.cover,),
            onpress: (){
            },)
          ],
        ),
      ),
    );
  }
  Widget inFoYou(UserChat userChat){
  return  Container(height: myHeight(350),width: myWidth(215),
      child: Column(
        children: [

          SizedBox(height: myHeight(20),),

        ],
      ),
    );
  }
  Widget _buildRowIcon(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIcon(height: 56,width: 56,image: 'assets/icons/mute.png',color: textColor,),
        SizedBox(width: myWidth(25),),
        InkWell( onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>VideoCall(userChat: widget.userChat,)));
        },
    child: CustomIcon(height: 56,width: 56,image: 'assets/icons/videocam.png',color: textColor)),
        SizedBox(width: myWidth(25),),
        CustomIcon(height: 56,width: 56,image: 'assets/icons/speaker.png',color: textColor),
      ],
    );
  }
  Widget _buildAvatarCall(UserChat userChat){
    return CircleAvatar(radius: myWidth(215/2),backgroundColor: Color(0xff4048EF).withOpacity(0.1),
        child:  CircleAvatar(radius: myWidth(178/2),backgroundColor: Color(0xff4048EF).withOpacity(0.1),
        child: CircleAvatar(radius: myWidth(146/2),backgroundColor: Color(0xff596DFF).withOpacity(0.1),
        child: CircleAvatar(radius: myWidth(111/2),backgroundImage: AssetImage(userChat.avatar),))
        ));
  }
  Widget _buildAppBar(Size size){
    return Container(height: myHeight(133),width: size.width,
    child: Stack(
      children: [
        Positioned(top: myHeight(74),left: myWidth(20),child: IconBack()),
        Positioned(top: myHeight(64),left: myWidth(315),child: AvatarIcon())
      ],
    ),);
  }
}
