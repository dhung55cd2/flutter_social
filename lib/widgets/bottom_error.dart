import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';

class BottomErrorCreatAccount extends StatelessWidget {
  const BottomErrorCreatAccount({
    Key key,
    @required this.isName,
    @required this.isEmail,
    @required this.isPass,
    @required this.isRepeatPass, this.height,
  }) : super(key: key);
  final double height;
  final bool isName;
  final bool isEmail;
  final bool isPass;
  final bool isRepeatPass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(height: myHeight(height),width: size.width,color: Colors.teal[50],alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isName  ? const SizedBox() : Text("Họ tên chưa hợp lệ", style: TextStyle(color: Colors.black,fontSize: mySize(16)),),
            SizedBox(height: myHeight(5),),
            isEmail ? const SizedBox() : Text("Email chưa hợp lệ", style: TextStyle(color: Colors.black,fontSize: mySize(16)),),
            SizedBox(height: myHeight(5),),
            isPass ? const SizedBox() : Text("Mật khẩu chưa hợp lệ", style: TextStyle(color: Colors.black,fontSize: mySize(16)),),
            SizedBox(height: myHeight(5),),
            isRepeatPass ? const SizedBox() : Text("Nhập lại mật khẩu chưa chính xác", style: TextStyle(color: Colors.black,fontSize: mySize(16)),),
            SizedBox(height: myHeight(5),),
          ],
        ),),
    );
  }
}

class BottomErrorLogin extends StatelessWidget {
  const BottomErrorLogin({
    Key key,
    @required this.emailValid,
    @required this.passValid,
  }) : super(key: key);

  final bool emailValid;
  final bool passValid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(height: myHeight(80),width: size.width,color: Colors.teal[50],alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !emailValid ? Text("Email chưa hợp lệ", style: TextStyle(color: Colors.black,fontSize: mySize(16)),) : SizedBox(),
            SizedBox(height: myHeight(10),),
            !passValid ? Text("Password chưa hợp lệ",style: TextStyle(color: Colors.black,fontSize: mySize(16)),) : SizedBox()
          ],
        ),),
    );
  }
}