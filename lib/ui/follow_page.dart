import 'package:flutter/material.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/objects/item_images.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/utils/gridview_images.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';
import 'package:flutter_social/widgets/info_friend.dart';
import 'package:flutter_social/widgets/infor_statistics.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(height: size.height,width: size.width,
        child: Column(
          children: [
            _buildInfor(size),
            InforStatistics(posts: 132,followers: 170,following: 1500,),
            ImagesGridView(listImages: listImages,)
          ],
      ),
      ),
    );
  }
  Widget _buildInfor(Size size){
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
                  CustomAvatar(outsideradius: 65,insideradius: 60,images: 'assets/myimages/image2.jpg',),
                  SizedBox(width: myWidth(20),),
                  inFor(name: "Amanda Roberts", address: "San Francisco, CA", post: 78, followers: 213,isFollow: false),
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
  List<Images> listImages = [
    Images(image: 'assets/myimages/image0.jpg',isVideo: false),
    Images(image: 'assets/myimages/image1.jpg',isVideo: false),
    Images(image: 'assets/myimages/image2.jpg',isVideo: false),
    Images(image: 'assets/myimages/image3.jpg',isVideo: true),
    Images(image: 'assets/myimages/image4.jpg',isVideo: false),
    Images(image: 'assets/myimages/image5.jpg',isVideo: false),
    Images(image: 'assets/myimages/image6.png',isVideo: true),
    Images(image: 'assets/myimages/image7.png',isVideo: false),
    Images(image: 'assets/myimages/image8.jpg',isVideo: false),
    Images(image: 'assets/myimages/image9.jpg',isVideo: false),

  ];
}
