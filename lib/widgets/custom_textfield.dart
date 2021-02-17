import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class WidgetEmail extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  final String labelText;
   TextEditingController controllerEmail ;

   WidgetEmail({Key key, this.height, this.width, this.hintText, this.labelText, this.controllerEmail,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(height),width: myWidth(width),alignment: Alignment.bottomRight,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: Stack(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
              controller: controllerEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
                labelText: labelText,
                labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
              )
          ),
         controllerEmail.text.length ==0 ? SizedBox(): Positioned(right: 0,
            child: IconButton(icon: Icon(Icons.close,size: mySize(20), color: textColor,),
                onPressed: (){
                  controllerEmail.clear();
                }),
          )
        ],
      ),
    );
  }
}

class WidgetPassword extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final String labelText;
  TextEditingController controllerEmail ;
  bool checkShow = true;
   WidgetPassword({Key key, this.height, this.width, this.hintText, this.labelText,
     this.checkShow,this.controllerEmail,}) : super(key: key);

  @override
  _WidgetPasswordState createState() => _WidgetPasswordState();
}

class _WidgetPasswordState extends State<WidgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(widget.height),width: myWidth(widget.width),alignment: Alignment.bottomRight,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: Stack(
        children: [
          TextField(
                controller: widget.controllerEmail,
                obscureText: widget.checkShow,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
                  labelText: widget.labelText,
                  labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
                )
            ),
          Positioned(right: 0,
            child: IconButton(
              onPressed: (){
                setState(() {
                  widget.checkShow = !widget.checkShow;
                });
              },
              icon: widget.checkShow ? Image.asset('assets/icons/eye-off.png',scale: 2.75,color: textColor,)
                  :Icon(Icons.remove_red_eye,size: mySize(20),color: textColor,),
            ),
          )


        ],
      ),
    );
  }
}
