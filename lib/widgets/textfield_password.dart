import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
//suffixIcon
class TextFieldSuffixIcon extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final String labelText;
  final String titleIcon;

  const TextFieldSuffixIcon({Key key, this.height, this.width, this.hintText, this.labelText, this.titleIcon}) : super(key: key);

  @override
  _TextFieldSuffixIconState createState() => _TextFieldSuffixIconState();
}

class _TextFieldSuffixIconState extends State<TextFieldSuffixIcon> {
  bool checkShow = true;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Container(height: myHeight(widget.height),width: myWidth(widget.width),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: TextField(
        controller: _controller,obscureText: checkShow,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
            suffixIcon: widget.titleIcon == "" ? null :TextButton(
              onPressed: (){
              },
              child: Text(widget.titleIcon,style: TextStyle(fontSize: mySize(11),color: color_blue),),
            )
        ),
      ),
    );
  }
}
