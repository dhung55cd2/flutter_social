import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/login/WidgetTextField.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/login/backgroundlogin.dart';
import 'package:flutter_social/widgets/widget_login.dart';

class BodyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return KeyboardDismissOnTap(

        child: Container(height: double.infinity,width: size.width,color: Colors.white,
            alignment: Alignment.center,
          child:  Stack(
            children: [
              BackgroundLogin(),
              Positioned(bottom: myHeight(20),left: myWidth(20),right: myWidth(20),
                  child: TextFieldWidget(),)
            ],
    ))
    );
  }
}
