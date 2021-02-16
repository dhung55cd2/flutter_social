import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class WidgetEmail extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  final String labelText;

  const WidgetEmail({Key key, this.height, this.width, this.hintText, this.labelText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(height),width: myWidth(width),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
            labelText: labelText,
            labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
          )
      ),
    );
  }
}

class WidgetPassword extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final String labelText;

  bool checkShow = true;
   WidgetPassword({Key key, this.height, this.width, this.hintText, this.labelText,this.checkShow, }) : super(key: key);

  @override
  _WidgetPasswordState createState() => _WidgetPasswordState();
}

class _WidgetPasswordState extends State<WidgetPassword> {
  TextEditingController _controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: myHeight(widget.height),width: myWidth(widget.width),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
          child: Row(
            children: [
              Container(width: myWidth(widget.width-30),height: widget.height,
                child: TextField(
                  controller: _controller,
                    obscureText: widget.checkShow,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
                      labelText: widget.labelText,
                      labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
                    )
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    if(_controller.text != ""){
                      widget.checkShow = !widget.checkShow;
                    }
                  });
                },
                  child: Container(height: widget.height,width: myWidth(30),
                      child:widget.checkShow ? Image.asset('assets/icons/eye-off.png',scale: 2.5,color: textColor,)
                          :Icon(Icons.remove_red_eye,size: mySize(20),color: textColor,)
                  ))

            ],
          ),
        ),
      ],
    );
  }
}
