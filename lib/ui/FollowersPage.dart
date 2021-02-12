import 'package:flutter/material.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';
import 'package:flutter_social/widgets/info_friend.dart';

class FollowersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,width: size.width,
        child: Column(
          children: [
            _buildAppBar(size),
            _buildSearch(),
            SizedBox(height: myHeight(20),),
            _buildBodyPage()
          ],
        ),
      ),
    );
  }
  Widget _buildBodyPage(){
    return Expanded(child:
        SingleChildScrollView(
          child: Column(
            children: List.generate(listFollowers.length, (index) {
              return _buildItemBodyPage(listFollowers,index);
            }),
          ),
        )
    );
  }
  Widget _buildItemBodyPage(List<Followers> listFollowers,int index){
    Followers followers = listFollowers[index];
    return Container(height: myHeight(80),width: myWidth(335),margin: EdgeInsets.only(bottom: myHeight(20)),
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[100],width: myHeight(2))) ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAvatar(outsideradius: 27.5,insideradius: 27.5,images: followers.avatar,),
        InfoFriend(
          name: followers.name,
          address: followers.address,
          post: followers.posts,
          followers: followers.followers,
        ),
        followers.isFollow ? CustomButon(height: 30,width: 80,radius: 4,nameButton: "Following",background: Colors.white,textColor: textColor,textSize: 12,)
            :CustomButon(height: 30,width: 80,radius: 4,nameButton: "Follow",background: color_blue,textColor: Colors.white,textSize: 12,)
      ],
    ),);
  }
  Widget _buildSearch(){
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
  Widget _buildAppBar(Size size){
    return Container(
      height: myHeight(137),width: size.width,
      child: Stack(
        children: [
          Positioned(top: myHeight(74),left: myWidth(20),child: IconBack()),
          Positioned(top: myHeight(77),left: myWidth(126),
              child: Text("Your followers",style: TextStyle(color: textColor, fontSize: mySize(20)),)),
          Positioned(top: myHeight(64),left: myWidth(315),child: AvatarIcon())
        ],
      ),
    );
  }
  List<Followers> listFollowers = [
    Followers('assets/followers/iniesta.jpg', 'Andrés Iniesta', 'Spain', 200, 999,false),
    Followers('assets/followers/khangan.jpg', "Khả Ngân", "Sài Gòn ", 55, 310,false),
    Followers('assets/followers/khanhvan.jpg', "Khánh Vân", "Buôn Ma Thuật", 33, 122,true),
    Followers('assets/followers/nhunggumiho.jpg', 'Nhung Gumiho', 'Quảng Nam', 99, 199,true),
    Followers('assets/followers/phuonganh.jpg', "Phương Anh Bolero ", 'Sài Gòn', 50, 101,false),
    Followers('assets/followers/quynhtrang.jpg', "Quỳnh Trang Bolero", 'Sài Gòn', 70, 102,true),
    Followers('assets/followers/ronaldinho.jpg', 'Ronaldinho', "Brazil", 200, 999,true),
    Followers('assets/followers/ronaldo.jpg', 'Ronaldo', 'Portugal', 200, 999,false),
    Followers('assets/followers/sungha.jpg', "Sung Ha", 'Nghe An', 999, 999,false),
    Followers('assets/followers/vuphuongthao.jpg', 'Vũ Phương Thảo', 'Hà Nội ', 50, 100,true),
    Followers('assets/followers/xavi.jpg', "XaVi", "Spain", 200, 999,true),

  ];
}
