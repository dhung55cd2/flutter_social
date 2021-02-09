import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/body_login.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/widget_login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BodyLogin()

    );
  }

}
