import 'package:flutter/material.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/widgets/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';

class CreatPost extends StatefulWidget {
  @override
  _CreatPostState createState() => _CreatPostState();
}

class _CreatPostState extends State<CreatPost> {
  bool tabWidget = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,width: size.width,
        child: Column(
          children: [
            _buildAppBar(size),
            _buildBodyPage()
          ],
        ),
      ) ,
    );
  }
  Widget _buildBodyPage(){
    return Expanded(
      child: ListView(
          children: [
            _buildTextField(),
            SizedBox(height: myHeight(30),),
            _buildAddPhoto(),
            SizedBox(height: myHeight(30),),
            _buildTagAndCheckin(),
            SizedBox(height: myHeight(30),),
            CustomButon(height: 55,width: 295,nameButton: 'SHARE',radius: 10,background: color_blue,textColor: Colors.white,textSize: 12,)
          ]
      ),
    );
  }
  Widget _buildTagAndCheckin(){
    return Container(
      height: myHeight(186),width: myWidth(335),decoration: BoxDecoration(color: Colors.white,boxShadow: [
        BoxShadow(offset: Offset(1,10),blurRadius: myRadius(30),color: Colors.grey[100])
    ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: myHeight(93),width: myWidth(295),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: myHeight(1),color: Colors.grey[200]) )),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: mySize(20)),
                hintText: 'Enter your friends name',
                labelText: 'Tag Friends',
                labelStyle: TextStyle(color: subtextColor, fontSize: mySize(14)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: InputBorder.none
              ),
            ),
          ),

          Container(
            height: myHeight(93),width: myWidth(295),
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: mySize(20)),
                  hintText: 'Enter your location',
                  labelText: 'Check in',
                  labelStyle: TextStyle(color: subtextColor, fontSize: mySize(14)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAddPhoto(){
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return MaterialButton(onPressed: (){
          setState(() {
            print('ds');
            tabWidget = !tabWidget;
          });
        },padding: EdgeInsets.all(0),
          child: tabWidget ?
          Container(
            height: myHeight(195),width: myWidth(335),alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: myWidth(20),vertical: myHeight(20)),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6)),
                boxShadow: [BoxShadow(offset: Offset(10,10),blurRadius: myRadius(10),color: Colors.grey[50])],
                image: DecorationImage(image: AssetImage('assets/images/imagepost.png'),fit: BoxFit.cover)),
          ) :
          Container(
            height: myHeight(195),width: myWidth(335),alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: myWidth(20),vertical: myHeight(20)),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6)),
              boxShadow: [BoxShadow(offset: Offset(10,10),blurRadius: myRadius(10),color: Colors.grey[50])],),
            child: Column(
              children: [
                Container(alignment: Alignment.centerLeft,child: Text("Add Photo/Video",style: TextStyle(color: subtextColor, fontSize: mySize(14)),)),
                Container(height: myHeight(123),width: myWidth(141),child: Image.asset('assets/icons/ic-photo-camera-48px copy.png'))
              ],
            ),
          ),);
      },
    );
  }
  Widget _buildTextField(){
    return Container(
      height: myHeight(101),width: myWidth(335),padding: EdgeInsets.only(left: myWidth(20),top: myHeight(10)),
      decoration: BoxDecoration(color: Colors.white,boxShadow: [
        BoxShadow(offset: Offset(1,5), blurRadius: myRadius(5),color: Colors.grey[100])
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "What’s on your mind?",
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: mySize(20)),
          border: InputBorder.none
        ),
      ),
    );
  }
  Widget _buildAppBar(Size size){
    return Container(
      height: myHeight(155),width: size.width,
      child: Stack(
        children: [
          Positioned(top: myHeight(64),left: myWidth(20),child: IconBack()),
          Positioned(top: myHeight(64),left: myWidth(315),child: AvatarIcon()),
          Positioned(top: myHeight(101),left: myWidth(136.5),
              child: Text("Create post",style: TextStyle(color: textColor, fontSize: mySize(20)),))
        ],
      ),
    );
  }
}
