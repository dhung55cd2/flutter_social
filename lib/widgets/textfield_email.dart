import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class TextFieldSimple extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final String labelText;


  const TextFieldSimple({Key key, this.height, this.width, this.hintText, this.labelText}) : super(key: key);

  @override
  _TextFieldSimpleState createState() => _TextFieldSimpleState();
}

class _TextFieldSimpleState extends State<TextFieldSimple> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Container(height: myHeight(widget.height),width: myWidth(widget.width),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
        ),
      ),
    );
  }
}
