import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/personal_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/textfield_email.dart';
import 'package:flutter_social/widgets/textfield_password.dart';

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double hightUnHideSizeBox;
    return  KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible){
        isKeyboardVisible ? hightUnHideSizeBox= 0 : hightUnHideSizeBox=200;
      return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: myHeight(277),width: myWidth(335),
                child: Stack(
                  children: [
                    _buildWidgetLogin(),
                    Positioned(bottom: myHeight(0),left: myWidth(20),right: myWidth(20),
                        child: _buildButtonLogin(context))
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
      height: myHeight(250),width: myWidth(335),decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(10,10),blurRadius: myRadius(30),color: Colors.grey[300])
    ],color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6))),
      child: Column(
        children: [
          SizedBox(height: myHeight(23),),
          TextFieldSimple(height: 68,width: 295,hintText: "Enter email address",labelText:"Email or Username",),
          SizedBox(height: myHeight(23),),
          TextFieldSuffixIcon(height: 68,width: 295,hintText: "Enter password",labelText:"Password",titleIcon: "FORGOT?",)

        ],
      ),
    );
  }
  Widget _buildButtonLogin(BuildContext context){
    return Container(
      height: myHeight(55),width: myWidth(295),decoration: BoxDecoration(color: color_blue,borderRadius: BorderRadius.circular(myRadius(10))),
      child: MaterialButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPage()));
      },
      child: Text("LOGIN",style: TextStyle(color: Colors.white, fontSize: mySize(12)),),),
    );
  }
}
