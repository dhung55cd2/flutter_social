import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class CustomInfoStatistic extends StatefulWidget {
  final int number;
  final String title;
  final Function onPressed;

  const CustomInfoStatistic({Key key, this.number, this.title, this.onPressed}) : super(key: key);
  @override
  _CustomInfoStatisticState createState() => _CustomInfoStatisticState();
}

class _CustomInfoStatisticState extends State<CustomInfoStatistic> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: myHeight(48),
        alignment: Alignment.center,
        child: InkWell(onTap: widget.onPressed,
          child: Column(
            children: [
              Text(
                widget.number.toString(),
                style: TextStyle(color: textColor, fontSize: mySize(20)),
              ),
              SizedBox(
                height: myHeight(5),
              ),
              Text(
                widget.title,
                style: TextStyle(color: subtextColor, fontSize: mySize(14)),
              ),
            ],
          ),
        ));
  }
}
