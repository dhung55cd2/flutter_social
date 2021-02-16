import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/messenger/call_page.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/messenger/video_call.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/avatar_item.dart';
import 'package:flutter_social/widgets/build_custom_icon.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';

class Messenger extends StatefulWidget {
  final Followers userChat;

  const Messenger({Key key, this.userChat}) : super(key: key);
  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(height: size.height,width: size.width,
      child: Column(
        children: [
          _buildAppBar(size, widget.userChat),
          _buildTitlePage(widget.userChat),
          _buildBodyPage(size, widget.userChat),
          _buildTabChat(size)
        ],
      ),),
    );
  }
  Widget _buildTabChat(Size size){
    return Container(
      width: size.width,padding: EdgeInsets.symmetric(horizontal: myWidth(10),vertical: myHeight(10)),
      child: Row(
        children: [
          CustomIcon(height: 20,width: 20,image:'assets/icons/icon1.png' ,color: color_blue,),
          SizedBox(width: myWidth(20),),
          CustomIcon(height: 20,width: 20,image:'assets/icons/photo-camera.png' ,color: color_blue,),
          SizedBox(width: myWidth(20),),
         Container(height: myHeight(30),width: myWidth(30),
             child: Icon(Icons.image_outlined,color: color_blue,)),
          SizedBox(width: myWidth(20),),
          CustomIcon(height: 20,width: 20,image:'assets/icons/mute.png' ,color: color_blue,),
          SizedBox(width: myWidth(20),),
          Expanded(
            child: Container(height: myHeight(40),padding: EdgeInsets.only(left: myWidth(10),top: myHeight(10),bottom: myHeight(10)),
            decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(myRadius(20))),
            child: TextField(decoration: InputDecoration(border: InputBorder.none,
                labelText: "Aa",
                suffixIcon: Image.asset('assets/icons/send-message.png',scale: 1.25,),
                labelStyle: TextStyle(color: subtextColor,fontSize: mySize(12)),
              hintText: "Nhập tin nhắn..",
              hintStyle: TextStyle(color: subtextColor,fontSize: mySize(12)),
            ),),),
          ),
      


        ],
      )
    );
  }
  Widget _buildIcon(String image){
    return Container(height: myHeight(20),width: myWidth(20),
    child: Image.asset(image,color: color_blue,),);
  }
  Widget _buildBodyPage(Size size, Followers userChat){
    return Expanded(
      child: ListView.builder(padding: EdgeInsets.symmetric(vertical: myHeight(20),horizontal: myWidth(20)),itemCount: listMessanger.length,
          itemBuilder: (context, index) {
        return index% 2 ==0 ? _youMessenger(size, index, userChat) : _imessenger(size, index);
      }),
    );
  }
  Widget _youMessenger(Size size, int index, Followers userChat){
    return Container(
      width: size.width - myWidth(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CustomAvatar(outsideradius: 20,insideradius: 20,images: userChat.avatar,),
              SizedBox(height: myHeight(10),),
              Text("11:00",style: TextStyle(color: textColor, fontSize: mySize(10)),)
            ],
          ),
          SizedBox(width: myWidth(10),),
          Container(padding: EdgeInsets.only(top: myHeight(13),bottom: myHeight(11),left: myWidth(13),right: myWidth(13)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(myRadius(20)),border: Border.all(color: Colors.grey[200])),
              child: Text(listMessanger[index],style: TextStyle(color: textColor, fontSize: mySize(12)),)),
        ],
      ),
    );
  }
  Widget _imessenger(Size size, int index){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(),
      Container(padding: EdgeInsets.only(top: myHeight(13),bottom: myHeight(11),left: myWidth(13),right: myWidth(13)),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(myRadius(20)),color: color_blue),
            child: Text(listMessanger[index],style: TextStyle(color: Colors.white,fontSize: mySize(12)),)),
    ],
  );
  }
  Widget _buildTitlePage(Followers userChat) {
    return Container(
      height: myHeight(61),width: myWidth(335),alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: Colors.white,boxShadow: [
        BoxShadow(offset: Offset(0,1),blurRadius: myRadius(1),color: Colors.grey[100])
      ]),
      child: Row(

        children: [
          AvatarItem(userChat: userChat,),
          SizedBox(width: myWidth(17),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userChat.name, style: TextStyle(color: textColor, fontSize: mySize(14)),),
              Text(userChat.isOnline? "Active now" :"Not active", style: TextStyle(color: subtextColor, fontSize: mySize(12)),),
            ],
          )
        ],
      )
    );
  }
  Widget _buildAppBar(Size size, Followers userChat){
    return Container(width: size.width,height: myHeight(113),
    child: Stack(
      children: [
        Positioned(top: myHeight(74),left: myWidth(20),child: IconBack()),
        Positioned(top: myHeight(72),left: myWidth(223),child: Container(height: myHeight(32),width: myWidth(72),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
           InkWell(onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) =>CallPage(userChat: userChat,)));
           },
    child: Image.asset('assets/icons/Path.png',fit: BoxFit.cover,color: color_blue,)),
            InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>VideoCall(userChat: widget.userChat,)));},
                child: Image.asset('assets/icons/videocam.png',fit: BoxFit.cover,color: color_blue,)),
          ],),)),
        Positioned(top: myHeight(64),left: myWidth(315),child: AvatarIcon())
      ],
    ),);
  }

  List<String> listMessanger = [
    'Hello, i’m glad to see you :)',
    'Hello, Amanda!',
    'I want to invite you on my birthday party',
    'Sure, with pleasure. Saturday?',
    'Yes, Saturday',
    'We\'ll see you on Saturday :)',
    'Ok, bye :*',
    'Have a nice day'
  ];
}
