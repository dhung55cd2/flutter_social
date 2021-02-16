import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/creataccout/widget_textfield.dart';
import 'package:flutter_social/widgets/background.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double _heightShowKeyboard=0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _keyboardIsVisible() ? _heightShowKeyboard = 40 : _heightShowKeyboard =0;
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: KeyboardDismissOnTap(
          child: Container(height: size.height,width: size.width,color: Colors.red,
              alignment: Alignment.center,
              child:  Stack(
                children: [
                  Background(title: "Creat account",subtitle: "Please enter your credentials in the form bellow:", widget: null,),
                  Container(height: size.height,width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFieldCreatAccount(),
                        SizedBox(height: myHeight(80+_heightShowKeyboard),)
                      ],
                    ),
                  )

                ],
              ))
      )
    );
  }
  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }
}
