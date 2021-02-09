import 'package:flutter_screenutil/flutter_screenutil.dart';

double myHeight( double height) {
  return ScreenUtil().setHeight(height);
}
double myWidth( double width) {
  return ScreenUtil().setWidth(width);
}
double mySize( double size) {
  return ScreenUtil().setSp(size);
}
double myRadius( double radius) {
  return ScreenUtil().radius(radius);
}