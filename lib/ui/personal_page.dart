import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_images.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                      child: _buildInforUser("Lisa Springston", "San Francisco, CA")),
                ],
              ),
            ),
            SizedBox(height: myHeight(30),),
            _thongKeTuongTac(),
            Expanded(
            child:StaggeredGridView.countBuilder(
                crossAxisCount: 3,
                itemCount: listImages.length,
                crossAxisSpacing: myWidth(4),
                mainAxisSpacing: myHeight(4),
                itemBuilder: (context, index){
                  return Container(height: myHeight(94),width: myWidth(109),alignment: Alignment.topRight,padding: EdgeInsets.only(top: myHeight(10),right: myWidth(10)),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage(listImages[index].image),fit: BoxFit.cover
                  )
                  ),child: listImages[index].isVideo ? Image.asset('assets/icons/icon_video.png'): SizedBox(),
                  );
                  },
                staggeredTileBuilder: (index){
                  return StaggeredTile.count(listImages[index].isVideo ? 2:1 , listImages[index].isVideo ? 2:1);
                  //StaggeredTile.count(1, index.isEven ? 3 : 1);
                }) ,)
            
          ],
        ),
     ),
    );
  }
  Widget _thongKeTuongTac(){
    return Container(height: myHeight(72),width: myWidth(335),
      padding: EdgeInsets.symmetric(horizontal: myWidth(30)),
    decoration: BoxDecoration(color: Colors.white,boxShadow: [
      BoxShadow(offset: Offset(7,7),blurRadius: myRadius(20),color: Colors.grey[200]),
      BoxShadow(offset: Offset(-1,-1),blurRadius: myRadius(1),color: Colors.grey[200])
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       _customListTitle(height: 48,width: 40,number: 250 ,subtitle: "Posts"),
        _customListTitle(height: 48,width: 63,number: 353 ,subtitle: "Followers"),
        _customListTitle(height: 48,width: 62,number: 1500 ,subtitle: "Following"),

      ],
    ),);
  }

  Widget _customListTitle({double height, double width,int number, String subtitle} ) {
    return Container(height: myHeight(height),width: myWidth(width),alignment: Alignment.center,
       child: Column(
         children: [
           Text(number.toString(), style: TextStyle(color: textColor, fontSize: mySize(20)),),
           SizedBox(height: myHeight(5),),
           Text(subtitle, style: TextStyle(color: subtextColor,fontSize: mySize(14)),),
         ],
       )
    );
  }
  Widget _buildInforUser(String name, String address){
    return Container(
      height: myHeight(204),width: myWidth(226),
      child: Stack(
        children: [
          Positioned(top: 0,left: 10,child: _circleAvatar()),
          Positioned(bottom: 0,left: 12,
            child: _nameAddress(name, address),
          ),
          Positioned(right: myWidth(0),top: myHeight(47),
          child: Container(height: myHeight(45),width: myWidth(118),alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(myRadius(10)),
      boxShadow: [
        BoxShadow(offset: Offset(3,7),blurRadius: myRadius(15),color: Colors.grey[300])
      ]),
          child: Text("EDIT PROFILE",style: TextStyle(color: color_editprofile,fontSize: mySize(12)),),))
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

  Widget _circleAvatar() {
    return CircleAvatar(
         radius: myRadius(69.5),
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: myRadius(64.5),
            child: Image.asset('assets/images/own_avatar.png',scale: 0.1,),
          ),
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
