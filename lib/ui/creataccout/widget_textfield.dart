import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/textfield_email.dart';
import 'package:flutter_social/widgets/textfield_password.dart';

class TextFieldCreatAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double hightUnHideSizeBox;
    return  KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible){
          isKeyboardVisible ? hightUnHideSizeBox= 0 : hightUnHideSizeBox=100;
          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: myHeight(460),width: myWidth(335),
                  child: Stack(
                    children: [
                      _buildWidgetLogin(),
                      Positioned(bottom: myHeight(0),left: myWidth(20),right: myWidth(20),
                          child: _buildButtonLogin())
                    ],

                  ),
                ),
                SizedBox(height: myHeight(hightUnHideSizeBox),)
              ],

            ),

          );
        }

    );
  }
  Widget _buildWidgetLogin(){
    return Container(
      height: myHeight(431.5),width: myWidth(335),decoration: BoxDecoration(boxShadow: [
      BoxShadow(offset: Offset(10,10),blurRadius: myRadius(30),color: Colors.grey[300])
    ],color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6))),
      child: Column(
        children: [
          SizedBox(height: myHeight(23),),
          TextFieldSimple(height: 68,width: 295,hintText: "Enter your name",labelText:"Name",),
          SizedBox(height: myHeight(23),),
          TextFieldSimple(height: 68,width: 295,hintText: "Enter your email address",labelText:"Email",),
          SizedBox(height: myHeight(23),),
          TextFieldSimple(height: 68,width: 295,hintText: "Choose a password",labelText:"Password",),
          SizedBox(height: myHeight(23),),
          TextFieldSimple(height: 68,width: 295,hintText: "Repeat a password",labelText:"Password",),


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
