import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_images.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/create_post.dart';
import 'package:flutter_social/ui/friend/FollowersPage.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/utils/gridview_images.dart';
import 'package:flutter_social/widgets/customInfoStatistic.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(height: size.height,width: size.width,
      child: Column(
          children: [
            Container(width: size.width,height: myHeight(300),
              child: Stack(
                children: [
                  Container(width: size.width,height: myHeight(170),
                  child: Image.asset('assets/images/backround.png',fit: BoxFit.fill,),),
                  Positioned(top: myHeight(99),left: myWidth(118),
                      child: _buildInforUser(context,"Lisa Springston", "San Francisco, CA",listImages[0].image)),
                ],
              ),
            ),
            SizedBox(height: myHeight(30),),
           _buildRowInfoStatistics(context),
            ImagesGridView(listImages: listImages,)
            
          ],
        ),
     ),
    );
  }
  Widget _buildRowInfoStatistics(BuildContext context){
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
          CustomInfoStatistic(number: 250,title: "Posts",onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatPost()));
          },),
          CustomInfoStatistic(number: 353,title: "Followers",onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersPage()));
          },),
          CustomInfoStatistic(number: 1500,title: "Following",onPressed: (){},),
        ],
      ),
    );
  }
  Widget _buildInforUser(BuildContext context,String name, String address, String image){
    return Container(
      height: myHeight(204),width: myWidth(226),
      child: Stack(
        children: [
          Positioned(top: 0,left: 10,child: CustomAvatar(outsideradius: 69.5,insideradius: 64.5,images: image,)),
          Positioned(bottom: 0,left: 12,
            child: _nameAddress(name, address),
          ),
          Positioned(right: myWidth(0),top: myHeight(47),
          child: Container(height: myHeight(45),width: myWidth(118),alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(myRadius(10)),
      boxShadow: [
        BoxShadow(offset: Offset(3,7),blurRadius: myRadius(15),color: Colors.grey[300])
      ]),
          child: MaterialButton(onPressed: (){},
              child: Text("EDIT PROFILE",style: TextStyle(color: color_editprofile,fontSize: mySize(12)),)),))
        ],
      ),
    );
  }
  Widget _nameAddress(String name, String address) {
    return RichText(textAlign: TextAlign.center,
              text: TextSpan(
            text: name+"\n", style: TextStyle(color: textColor,fontSize: mySize(20)),
            children: [
              TextSpan(text: address, style: TextStyle(color: subtextColor,fontSize: mySize(14)))
            ]
          ));
  }
  List<Images> listImages = [
    Images(image: 'assets/account/account1.jpg',isVideo: false),
    Images(image: 'assets/account/account2.jpg',isVideo: false),
    Images(image: 'assets/account/account3.jpg',isVideo: false),
    Images(image: 'assets/account/account4.jpg',isVideo: true),
    Images(image: 'assets/account/account5.jpg',isVideo: false),
    Images(image: 'assets/account/account6.jpg',isVideo: false),
    Images(image: 'assets/account/account7.jpg',isVideo: true),
    Images(image: 'assets/account/account8.jpg',isVideo: false),
    Images(image: 'assets/account/account9.jpg',isVideo: false),
    Images(image: 'assets/account/account10.jpg',isVideo: false),

  ];
}
