import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/creataccout/create_account.dart';
import 'package:flutter_social/utils/colors.dart';

class BackgroundLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(height: size.height,width: size.width,color: Colors.grey[50],
      child: ListView(
        children: [
          SizedBox(height: myHeight(64)),
          _buildAppBar(size,context),
          SizedBox(height: myHeight(40),),
          _buildWidgetWelcomBack(),
          SizedBox(height: myHeight(20),),
          _buildWidgetImage(size),
          SizedBox(height: myHeight(175),),
          _buildSignUpNow(context),
        ],

      ),
    );
  }
  Widget _buildSignUpNow(BuildContext context){
    return Container(
      height: myHeight(36),width: myWidth(295),alignment: Alignment.center,
      child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
      },
          child: Text('Dont\’ have an account yet\?\nSIGN UP NOW', textAlign: TextAlign.center,)),
    );
  }
  Widget _buildAppBar(Size size, BuildContext context){
    return Container(height: myHeight(14),width:size.width,padding: EdgeInsets.only(left: myWidth(20)),alignment: Alignment.centerLeft,
        child: Container(
            height: myHeight(14),width: myWidth(20),child: InkWell(onTap: (){
              Navigator.of(context).pop();
        }
        ,child: Image.asset('assets/icons/back_arrow.png'))));

  }
  Widget _buildWidgetImage(Size size) {
    return Container(height: myHeight(325),width: size.width,
        child: Image.asset('assets/images/sample_image.png',fit: BoxFit.cover,));
  }
  Widget _buildWidgetWelcomBack(){
    return Container(height: myHeight(60),width: myWidth(295),
        child: Column(
          children: [
            Container(height: myHeight(40),width: myWidth(295),alignment: Alignment.center,
                child: Text("Welcome back",style: TextStyle(color: textColor, fontSize: mySize(30)),)),
            SizedBox(height: myHeight(4),),
            Container(height: myHeight(16),width: myWidth(295),alignment: Alignment.center,
                child: Text("Please enter your credentials in the form bellow:",style: TextStyle(color: subtextColor, fontSize: mySize(12)),)),
          ],
        )
    );
  }
}
