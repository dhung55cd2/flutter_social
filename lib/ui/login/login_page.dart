import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/login/WidgetTextField.dart';
import 'package:flutter_social/ui/login/backgroundlogin.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Stack(
        children: [
          BackgroundLogin(),
          Container(height: size.height,width: size.width,color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(),
                SizedBox(height: myHeight(200),)
              ],
            ),
          ),

        ],
      )

    );
  }

}
