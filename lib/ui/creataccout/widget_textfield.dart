
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/widgets/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/login/login_page.dart';
import 'package:flutter_social/ui/social_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/bottom_error.dart';
import 'package:flutter_social/widgets/custom_textfield.dart';
class TextFieldCreatAccount extends StatelessWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final TextEditingController controllerRepeatPass;
  bool isName = false;
  bool isEmail = false;
  bool isPass = false ;
  bool isRepeatPass = false ;

   TextFieldCreatAccount({Key key, this.controllerName, this.controllerEmail, this.controllerPass, this.controllerRepeatPass}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(height: myHeight(460),width: myWidth(335),
      child: Stack(
        children: [
          _buildWidgetLogin(),
          Positioned(bottom: myHeight(0),left: myWidth(20),right: myWidth(20),
              child: _buildButtonLogin(context,size))
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
          WidgetEmail(height: 68,width: 295,hintText: "Enter your name",labelText: "Name",controllerEmail: controllerName,),
          SizedBox(height: myHeight(23),),
          WidgetEmail(height: 68,width: 295,hintText: "Enter your email address",labelText: "Emal",controllerEmail: controllerEmail,),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: "Choose a password",labelText: "Password",checkShow: true,controllerEmail: controllerPass,),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: "Repeat a password",labelText: "Password",checkShow: true,controllerEmail: controllerRepeatPass,),


        ],
      ),
    );
  }
  Widget _buildButtonLogin(BuildContext context, Size size){
    return CustomButon(
      onpress: (){
        controllerName.text.length >0 ? isName = true : isName = false;
        controllerEmail.text.length >6 && controllerEmail.text.contains('@gmail.com') ? isEmail = true : isEmail = false;
        controllerPass.text.length > 6  ? isPass = true : isPass = false;
        controllerRepeatPass.text.length > 6 && controllerRepeatPass.text == controllerPass.text ? isRepeatPass = true : isRepeatPass = false;
        if(isName && isEmail && isPass & isRepeatPass) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SocialPage()));
        } else {
          showBottomSheet(context: context, builder: (context) {
            return BottomErrorCreatAccount(isName: isName, isEmail: isEmail, isPass: isPass, isRepeatPass: isRepeatPass,height: 120,);
          });
        }

      },
      height: 55,width: 295,radius: 10,nameButton: "SIGN UP",
      background: color_blue,textColor: Colors.white,textSize: 12,);

  }
}


