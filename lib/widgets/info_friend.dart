import 'package:flutter/material.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/widgets/CustomButton.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';

class InfoFriend extends StatelessWidget {
  final String name;
  final String address;
  final int post;
  final int followers;

   InfoFriend({Key key, this.name, this.address, this.post, this.followers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: myHeight(3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(color: textColor, fontSize: mySize(16)),),
          SizedBox(height: myHeight(2),),
          Text(address, style: TextStyle(color: subtextColor, fontSize: mySize(12)),),
          SizedBox(height: myHeight(2),),
          Row(
            children: [
              Text(post.toString()+" posts", style: TextStyle(color: textColor, fontSize: mySize(12)),),
              SizedBox(width: myWidth(10),),
              Text(followers.toString()+" Followers", style: TextStyle(color: textColor, fontSize: mySize(12)),),
            ],
          ),
          SizedBox(height: myHeight(7),),
        ],
      ),
    );
  }
}
