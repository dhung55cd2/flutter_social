import 'package:flutter/material.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/widgets/CustomButton.dart';
import 'package:flutter_social/objects/item_images.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/create_post.dart';
import 'package:flutter_social/ui/friend/FollowersPage.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/utils/gridview_images.dart';
import 'package:flutter_social/widgets/customInfoStatistic.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';
import 'package:flutter_social/widgets/info_friend.dart';
import 'package:flutter_social/widgets/infor_statistics.dart';

class FollowPage extends StatefulWidget {
  final Users followers;

  const FollowPage({Key key, this.followers}) : super(key: key);
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  @override
  Widget build(BuildContext context) {
    List<Images> listimage = List();
    for(int i = 0; i < widget.followers.listImages.length; i++) {
      listimage.add(Images(image: widget.followers.listImages[i], isVideo: i %3 ==0 ? true :false));
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(height: size.height,width: size.width,
        child: Column(
          children: [
            _buildInfor(size, widget.followers),
            _buildRowInfoStatistics(context, widget.followers),
            ImagesGridView(listImages: listimage,)
          ],
      ),
      ),
    );
  }
  Widget _buildRowInfoStatistics(BuildContext context, Users followers){
    return Container(  height: myHeight(72), width: myWidth(335),
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
          CustomInfoStatistic(number: followers.posts,title: "Posts",onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatPost()));
          },),
          CustomInfoStatistic(number: followers.followers,title: "Followers",onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersPage()));
          },),
          CustomInfoStatistic(number: followers.following,title: "Following",onPressed: (){},),
        ],
      ),
    );
  }

  Widget _buildInfor(Size size, Users followers){
    return Container(height: myHeight(268),width: size.width,
      child: Stack(
        children: [
          Positioned(top: myHeight(74),left: myWidth(20),
          child: IconBack()),
         Positioned(top: myHeight(64),left: myWidth(315),
             child: AvatarIcon()),
          Positioned(top: myHeight(108),left: myWidth(20),
              child: Row(
                children: [
                  CustomAvatar(outsideradius: 65,insideradius: 60,images: followers.avatar,),
                  SizedBox(width: myWidth(20),),
                  inFor(name: followers.name, address: followers.address, post: followers.posts, followers: followers.followers,isFollow: false),
                ],
              ))
        ],
      ),
    );
  }

  Widget inFor({String name, String address, int post, int followers,bool isFollow}){
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoFriend(name:name ,address: address,post: post,followers: followers,),
            SizedBox(height: myHeight(7),),
            MaterialButton(padding: EdgeInsets.symmetric(vertical: myHeight(0),horizontal: myWidth(0)),
              onPressed: (){
                setState(() {
                  if(!isFollow) { followers++; } else {followers--;}
                  isFollow = !isFollow;
                });
              },
              child:   isFollow ? CustomButon(height: 30,width: 80,radius: 4,nameButton: "Following",background: Colors.white,textColor: textColor,textSize: 12,)
                  :CustomButon(height: 30,width: 80,radius: 4,nameButton: "Follow",background: color_blue,
                textColor: Colors.white,textSize: 12,),
            )
          ],
        );
      },
    );
  }
}
