
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/widgets/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/social_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/bottom_error.dart';
import 'package:flutter_social/widgets/custom_textfield.dart';

class TextFieldCreatAccount extends StatefulWidget {
  final TextEditingController controllerName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPass;
  final TextEditingController controllerRepeatPass;
  Account account;
   TextFieldCreatAccount({Key key, this.controllerName, this.controllerEmail, this.controllerPass,
     this.controllerRepeatPass, this.account,}) : super(key: key);

  @override
  _TextFieldCreatAccountState createState() => _TextFieldCreatAccountState();
}

class _TextFieldCreatAccountState extends State<TextFieldCreatAccount> {
  bool isName = false;
  bool isEmail = false;
  bool isPass = false ;
  bool isRepeatPass = false ;

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
          WidgetEmail(height: 68,width: 295,hintText: "Enter your name",labelText: "Name",controllerEmail: widget.controllerName,),
          SizedBox(height: myHeight(23),),
          WidgetEmail(height: 68,width: 295,hintText: "Enter your email address",labelText: "Emal",controllerEmail: widget.controllerEmail,),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: "Choose a password",labelText: "Password",checkShow: true,controllerEmail: widget.controllerPass,),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: "Repeat a password",labelText: "Password",checkShow: true,controllerEmail: widget.controllerRepeatPass,),
        ],
      ),
    );
  }
  Widget _buildButtonLogin(BuildContext context, Size size){
    return CustomButon(
      onpress: (){
        widget.controllerName.text.length >0 ? isName = true : isName = false;
        widget.controllerEmail.text.length >6 && widget.controllerEmail.text.contains('@gmail.com') ? isEmail = true : isEmail = false;
        widget.controllerPass.text.length > 6  ? isPass = true : isPass = false;
        widget.controllerRepeatPass.text.length > 6 && widget.controllerRepeatPass.text == widget.controllerPass.text ? isRepeatPass = true : isRepeatPass = false;
        if(isName && isEmail && isPass & isRepeatPass) {
          widget.account.name = widget.controllerName.text;
          widget.account.email= widget.controllerEmail.text;
          widget.account.password = widget.controllerPass.text;
          Navigator.push(context, MaterialPageRoute(builder: (context) => SocialPage(account: widget.account,)));
        }
        else {
          showBottomSheet(context: context, builder: (context) {
            return BottomErrorCreatAccount(isName: isName, isEmail: isEmail, isPass: isPass,
              isRepeatPass: isRepeatPass,height: 120,);
          });
        }

      },
      height: 55,width: 295,radius: 10,nameButton: "SIGN UP",
      background: color_blue,textColor: Colors.white,textSize: 12,);

  }
}


