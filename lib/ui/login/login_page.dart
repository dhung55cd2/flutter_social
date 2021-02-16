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
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  double _heightShowKeyboard =0;
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
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
                    TextFieldWidget(controllerEmail: controllerEmail,controllerPassword: controllerPassword,),
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
