import 'package:flutter/material.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/friend/follow_page.dart';
import 'package:flutter_social/ui/mypage/personal_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/custom_textfield.dart';

class TextFieldWidget extends StatefulWidget {
 final TextEditingController controllerEmail ;
 final TextEditingController controllerPassword ;

   TextFieldWidget({Key key, this.controllerEmail, this.controllerPassword}) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
 bool emailValid = false;
 bool passValid = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(height: myHeight(300),width: myWidth(335),
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
      height: myHeight(272.5),width: myWidth(335),decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(10,10),blurRadius: myRadius(30),color: Colors.grey[300])
    ],color: Colors.white,borderRadius: BorderRadius.circular(myRadius(6))),
      child: Column(
        children: [
          SizedBox(height: myHeight(23),),
          WidgetEmail(height: 68,width: 295,hintText: 'Enter email address',
            labelText: "Email or Username",controllerEmail: widget.controllerEmail,),
          SizedBox(height: myHeight(23),),
          WidgetPassword(height: 68,width: 295,hintText: 'Enter password',checkShow: true,
            labelText: "Password",controllerEmail: widget.controllerPassword,),
          SizedBox(height: myHeight(10),),
          Container(alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){},
                child: Text("FORGOT?",style: TextStyle(color: color_blue,fontSize: mySize(11)),)),
          )



        ],
      ),
    );
  }

  Widget _buildButtonLogin(BuildContext context, Size size){
    return MaterialButton(padding: EdgeInsets.symmetric(horizontal: myWidth(0),vertical: myHeight(0)),
      onPressed: (){
        setState(() {
          if(widget.controllerEmail.text.length < 6 || !widget.controllerEmail.text.contains('@gmail.com') ){
            emailValid = false;
          } else { emailValid = true;}
          if(widget.controllerPassword.text.length <6) {
            passValid = false;
          } else {passValid = true;}
        });
        if(emailValid ==true && passValid == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPage()));
        } else {
          showBottomSheet(context: context, builder: (context) {
            return Container(height: myHeight(100),width: size.width,color: Colors.teal[50],alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !emailValid ? Text("Email chưa hợp lệ", style: TextStyle(color: Colors.black,fontSize: mySize(16)),) : SizedBox(),
                SizedBox(height: myHeight(10),),
                !passValid ? Text("Password chưa hợp lệ",style: TextStyle(color: Colors.black,fontSize: mySize(16)),) : SizedBox()
              ],
            ),);
          });
        }

      },
      child: CustomButon(height: 55,width: 295,radius: 10,background: color_blue,nameButton: "LOGIN",
            textColor: Colors.white,textSize: 12,),
    );

  }
}
