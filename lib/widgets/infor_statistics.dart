import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/friend/FollowersPage.dart';
import 'package:flutter_social/utils/colors.dart';

class InforStatistics extends StatefulWidget {
  final Users follower;


  const InforStatistics(
      {Key key, this.follower})
      : super(key: key);
  @override
  _InforStatisticsState createState() => _InforStatisticsState();
}

class _InforStatisticsState extends State<InforStatistics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: myHeight(72),
      width: myWidth(335),
      padding: EdgeInsets.symmetric(horizontal: myWidth(30)),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(7, 7),
            blurRadius: myRadius(20),
            color: Colors.grey[200]),
        BoxShadow(
            offset: Offset(-1, -1),
            blurRadius: myRadius(1),
            color: Colors.grey[200])
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _customListTitle(
              height: 48, width: 40, number: widget.follower.posts, subtitle: "Posts"),
          _customListTitle(
              height: 48, width: 63, number: widget.follower.followers, subtitle: "Followers"),
          _customListTitle(
              height: 48, width: 62, number: widget.follower.following, subtitle: "Following"),
        ],
      ),
    );
  }

  Widget _customListTitle(
      {double height, double width, int number, String subtitle}) {
    return Container(
        height: myHeight(height),
        width: myWidth(width),
        alignment: Alignment.center,
        child: InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersPage()));
        },
          child: Column(
            children: [
              Text(
                number.toString(),
                style: TextStyle(color: textColor, fontSize: mySize(20)),
              ),
              SizedBox(
                height: myHeight(5),
              ),
              Text(
                subtitle,
                style: TextStyle(color: subtextColor, fontSize: mySize(14)),
              ),
            ],
          ),
        ));
  }
}
