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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: KeyboardDismissOnTap(
          child: Container(height: size.height,width: size.width,color: Colors.red,
              alignment: Alignment.center,
              child:  Stack(
                children: [
                  Background(title: "Creat account",subtitle: "Please enter your credentials in the form bellow:",
                  widget: null,),
                  Positioned(top: myHeight(235),left: myWidth(20),right: myWidth(20),
                      child: TextFieldCreatAccount())

                ],
              ))
      )
    );
  }
}
