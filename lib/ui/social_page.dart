import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,width: size.width,color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: myHeight(130),),
            _buildWidgetOval(),
            SizedBox(height: myHeight(46),),
            Text("Social",style: TextStyle(color: textColor,fontSize: mySize(40), fontWeight: FontWeight.normal),),
            SizedBox(height: myHeight(6),),
            Text("Cool tagline goes here",style: TextStyle(color: subtextColor,fontSize: mySize(15), fontWeight: FontWeight.normal),),
            SizedBox(height: myHeight(155),),
            _buildButtonConnectFacebook(icon: 'assets/icons/social-facebook.png', title: 'CONNECT WITH FACEBOOK',color: color_connect_facebook),
            SizedBox(height: myHeight(30),),
            _buildButtonConnecEmail(icon: 'assets/icons/icon_email.png', title: 'SIGN UP USING EMAIL',color: color_blue),
            SizedBox(height: myHeight(75),),
            _buildLogin()
          ],
        ),
      ),
    );
  }
  Widget _buildLogin(){
    return Container(
      height: myHeight(36),width: myWidth(295),alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
           TextSpan( text: 'I already have an account.\n',style: TextStyle(color: textColor,fontSize: mySize(12)),),
            TextSpan( text: 'LOGIN NOW',style: TextStyle(color: textColor,fontSize: mySize(12)),),
          ]
        ),
      ),
    );
  }
  Widget _buildButtonConnectFacebook({String icon, String title, Color color}) {
    return MaterialButton(onPressed: (){},
          child: Container(height: myHeight(55),width: myWidth(295),
          decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(myRadius(10)),),
          child: Row(children: [
            SizedBox(width: myWidth(30),),
            Container(width: myWidth(20),height: myHeight(20),child: Image.asset(icon)),
            SizedBox(width: myWidth(30),),
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: mySize(11)),)
          ],)
          ),);
  }
  Widget _buildButtonConnecEmail({String icon, String title, Color color}) {
    return MaterialButton(onPressed: (){},
      child: Container(height: myHeight(55),width: myWidth(295),
          decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(myRadius(10)),boxShadow: [
            BoxShadow(offset: Offset(0,5),blurRadius: 30,color: Colors.blue[200])
          ]),
          child: Row(children: [
            SizedBox(width: myWidth(30),),
            Container(width: myWidth(20),height: myHeight(20),child: Image.asset(icon)),
            SizedBox(width: myWidth(30),),
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: mySize(11)),)
          ],)
      ),);
  }
  Widget _buildWidgetOval(){
    return Container(
      height: myHeight(80),width: myWidth(130),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              height: myHeight(80),width: myWidth(80),child: Image.asset('assets/icons/oval_blue.png'),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: myHeight(80),width: myWidth(80),child: Image.asset('assets/icons/oval_pink.png'),
            ),
          ),
        ],
      ),
    );
  }
}
