import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/login/WidgetTextField.dart';
import 'package:flutter_social/ui/login/backgroundlogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _heightShowKeyboard =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _keyboardIsVisible() ? _heightShowKeyboard =100 : _heightShowKeyboard =0;
    return KeyboardDismissOnTap(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:  Stack(
            children: [
              BackgroundLogin(),
              Container(height: size.height,width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFieldWidget(),
                    SizedBox(height: (myHeight(200)+myHeight(_heightShowKeyboard)),)
                  ],
                ),
              )


            ],
          )

      ),
    );
  }
  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }
}
