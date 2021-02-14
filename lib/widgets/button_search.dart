import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class ButtonSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: myHeight(32),width: myWidth(335),
        decoration: BoxDecoration(color: Colors.white,
            boxShadow: [
              BoxShadow(offset: Offset(0,5),blurRadius: myRadius(10),color: Colors.grey[200])
            ]),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Container(height: myHeight(16),width: myWidth(16),
                child: Image.asset('assets/icons/search_ico.png',color: subtextColor,
                  fit: BoxFit.cover,)),
            SizedBox(width: myWidth(15),),
            Text("Search",style: TextStyle(color: subtextColor,fontSize: mySize(14)),)
          ],
        )
    );
  }
}
