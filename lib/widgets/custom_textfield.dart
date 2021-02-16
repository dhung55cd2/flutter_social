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
    return Container(height: myHeight(height),width: myWidth(width),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
          controller: controllerEmail,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
            labelText: labelText,
            labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
            suffixIcon: controllerEmail.text.length ==0 ? SizedBox(width: 0,) :
            IconButton(icon: Icon(Icons.close), onPressed: (){controllerEmail.clear();})
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: myHeight(widget.height),width: myWidth(widget.width),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
          child: Row(
            children: [
              Container(width: myWidth(widget.width),height: widget.height,
                child: TextField(
                  controller: widget.controllerEmail,
                    obscureText: widget.checkShow,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.grey[400],fontSize: mySize(20)),
                      labelText: widget.labelText,

                      labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              widget.checkShow = !widget.checkShow;
                            });
                          },
                          icon: widget.checkShow ? Image.asset('assets/icons/eye-off.png',scale: 2.5,color: textColor,)
                              :Icon(Icons.remove_red_eye,size: mySize(20),color: textColor,),
                        )
                    )
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }
}
