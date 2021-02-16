import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/personal_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/textfield_email.dart';
import 'package:flutter_social/widgets/textfield_password.dart';

class TextFieldWidget extends StatelessWidget {
  double height = 0;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Container(height: myHeight(277),width: myWidth(335),
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
    return MaterialButton(padding: EdgeInsets.symmetric(horizontal: myWidth(0),vertical: myHeight(0)),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPage()));
      },
      child: CustomButon(height: 55,width: 295,radius: 10,background: color_blue,nameButton: "LOGIN",
            textColor: Colors.white,textSize: 12,),
    );

  }
}
