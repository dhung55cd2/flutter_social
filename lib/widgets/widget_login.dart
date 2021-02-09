import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: myHeight(277),width: myWidth(335),decoration: BoxDecoration(boxShadow: [

      BoxShadow(offset: Offset(1,1),spreadRadius: myRadius(1),blurRadius: myRadius(30),color: Colors.grey[300]),
    ])
      ,child: Stack(
      children: [
        _buildWidgetLogin(),
        Positioned(bottom: 0,left: 20,right: 20,child: _buildButtonLogin())
      ],
    ),
    );
  }
  Widget _buildWidgetLogin(){
    return Container(
      height: myHeight(250),width: myWidth(335),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6))),
      child: Column(
        children: [
          SizedBox(height: myHeight(23),),
          Container(height: myHeight(68),width: myWidth(295),decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter email address",
                hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
                labelText: "Email or Username",
                labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
              ),
              textInputAction: TextInputAction.none,
            ),
          ),
          SizedBox(height: myHeight(23),),
          Container(height: myHeight(68),width: myWidth(295),decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter password",
                  hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
                  labelText: "Password",
                  labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
                  suffixIcon: TextButton(child: Text("FORGOT?",style: TextStyle(color: color_blue,fontSize: mySize(11)),),)
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildButtonLogin(){
    return Container(
      height: myHeight(55),width: myWidth(295),decoration: BoxDecoration(color: color_blue,borderRadius: BorderRadius.circular(myRadius(10))),
      child: MaterialButton(child: Text("LOGIN",style: TextStyle(color: Colors.white, fontSize: mySize(12)),),),
    );
  }
}
