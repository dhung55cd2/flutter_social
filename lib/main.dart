import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social/ui/home_page.dart';
import 'package:flutter_social/ui/login_page.dart';
import 'package:flutter_social/ui/social_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(375,812),
    allowFontScaling: false,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.white),
      home: LoginPage(),
    ) ,);
  }
}

