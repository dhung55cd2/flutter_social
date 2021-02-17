import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/ui/social_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Account account = Account();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(375,812),
    allowFontScaling: false,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.white),
      home: SocialPage(account: account,),
    ) ,);
  }
}
