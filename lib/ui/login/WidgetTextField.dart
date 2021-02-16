import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/mypage/personal_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/custom_textfield.dart';

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(height: myHeight(300),width: myWidth(335),
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
      height: myHeight(272.5),width: myWidth(335),decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(10,10),blurRadius: myRadius(30),color: Colors.grey[300])
    ],color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6))),
      child: Column(
        children: [
          SizedBox(height: myHeight(23),),
          WidgetEmail(height: 68,width: 295,hintText: 'Enter email address',labelText: "Email or Username",),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: 'Enter password',checkShow: true,labelText: "Password",),
          SizedBox(height: myHeight(10),),
          Container(alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){},
                child: Text("FORGOT?",style: TextStyle(color: color_blue,fontSize: mySize(11)),)),
          )



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
