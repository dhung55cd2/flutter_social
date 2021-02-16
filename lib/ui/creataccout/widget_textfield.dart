
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/login/login_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/custom_textfield.dart';
class TextFieldCreatAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(460),width: myWidth(335),
      child: Stack(
        children: [
          _buildWidgetLogin(),
          Positioned(bottom: myHeight(0),left: myWidth(20),right: myWidth(20),
              child: _buildButtonLogin(context))
        ],

      ),
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
          WidgetEmail(height: 68,width: 295,hintText: "Enter your name",labelText: "Name",),
          SizedBox(height: myHeight(23),),
          WidgetEmail(height: 68,width: 295,hintText: "Enter your email address",labelText: "Emal",),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: "Choose a password",labelText: "Password",checkShow: true,),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: "Repeat a password",labelText: "Password",checkShow: true,),


        ],
      ),
    );
  }
  Widget _buildButtonLogin(BuildContext context){
    return CustomButon(
      onpress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      height: 55,width: 295,radius: 10,nameButton: "SIGN UP",
      background: color_blue,textColor: Colors.white,textSize: 12,);

  }
}
