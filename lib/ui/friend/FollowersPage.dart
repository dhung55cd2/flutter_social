
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/CustomButton.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/friend/follow_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/button_search.dart';
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
            ButtonSearch(),
            SizedBox(height: myHeight(20),),
            _buildBodyPage(context, listFollowers)
          ],
        ),
      ),
    );
  }
  Widget _buildBodyPage(BuildContext context, List<Followers> list){
    return Expanded(child:
        SingleChildScrollView(
          child: Column(
            children: List.generate(list.length, (index) {
              return _buildItemBodyPage(list,index,context);
            }),
          ),
        )
    );
  }
  Widget _buildItemBodyPage(List<Followers> listFollowers,int index, BuildContext context){
    Followers followers = listFollowers[index];
    return Container(height: myHeight(80),width: myWidth(335),margin: EdgeInsets.only(bottom: myHeight(20)),
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[100],width: myHeight(2))) ),
    child: MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FollowPage(followers: followers,)));
      },
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
          followers.isFollow ? CustomButon(height: 31,width: 81,radius: 4,nameButton: "Following",background: Colors.white,textColor: textColor,textSize: 12,)
              :CustomButon(height: 30,width: 80,radius: 4,nameButton: "Follow",background: color_blue,textColor: Colors.white,textSize: 12,)
        ],
      ),
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
    Followers(
        avatar: 'assets/followers/iniesta/iniesta1.jpg',
        name:  'Andrés Iniesta',
        address: 'Spain',
        posts: 5,followers: 200,following: 999,isFollow: false,messenger: "Xin chào tôi là Iniesta",
        time: 16,isOnline: true,Unread: 2,listImages:
    ['assets/followers/iniesta/iniesta1.jpg', 'assets/followers/iniesta/iniesta2.jpg',
      'assets/followers/iniesta/iniesta3.jpg', 'assets/followers/iniesta/iniesta4.jpg',
      'assets/followers/iniesta/iniesta5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/khangan/khangan1.jpg',
        name:  'Khả Ngân',
        address: 'Sài Gòn',
        posts: 5,followers: 310,following: 151,isFollow: false,messenger: "Xin chào tôi là Khả Ngân",
        time: 8,isOnline: false,Unread: 5,listImages:
    ['assets/followers/khangan/khangan1.jpg', 'assets/followers/khangan/khangan2.jpg',
      'assets/followers/khangan/khangan3.jpg', 'assets/followers/khangan/khangan4.jpg',
      'assets/followers/khangan/khangan5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/ronaldinho/ronaldinho1.jpg',
        name:  'Ronaldinho',
        address: 'Brazil',
        posts: 5,followers: 399,following: 100,isFollow: true,messenger: "Xin chào tôi là Ronaldinho",
        time: 9,isOnline: false,Unread: 0,listImages:
    ['assets/followers/ronaldinho/ronaldinho1.jpg', 'assets/followers/ronaldinho/ronaldinho2.jpg',
      'assets/followers/ronaldinho/ronaldinho3.jpg', 'assets/followers/ronaldinho/ronaldinho4.jpg',
      'assets/followers/ronaldinho/ronaldinho5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/khanhvan/khanhvan1.jpg',
        name:  'Đỗ Khánh Vân',
        address: 'Buôn Ma Thuật',
        posts: 5,followers: 201,following: 105,isFollow: false,messenger: "Xin chào tôi là Đỗ Khánh Vân",
        time: 15,isOnline: false,Unread: 0,listImages:
    ['assets/followers/khanhvan/khanhvan1.jpg', 'assets/followers/khanhvan/khanhvan2.png',
      'assets/followers/khanhvan/khanhvan3.jpg', 'assets/followers/khanhvan/khanhvan4.jpg',
      'assets/followers/khanhvan/khanhvan5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/ronaldo/ronaldo1.jpg',
        name:  'Ronaldo Cr7',
        address: 'Portugal',
        posts: 5,followers: 501,following: 999,isFollow: false,messenger: "Xin chào tôi là Ronaldo Cr7",
        time: 9,isOnline: true,Unread: 3,listImages:
    ['assets/followers/ronaldo/ronaldo1.jpg', 'assets/followers/ronaldo/ronaldo2.jpg',
      'assets/followers/ronaldo/ronaldo3.jpg', 'assets/followers/ronaldo/ronaldo4.jpg',
      'assets/followers/ronaldo/ronaldo5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/nhunggumiho/nhunggumiho1.jpg',
        name:  'Nhung Gumiho',
        address: 'Quảng Nam',
        posts: 5,followers: 201,following: 300,isFollow: true,messenger: "Xin chào tôi là Nhung Gumiho",
        time: 14.5,isOnline: false,Unread: 0,listImages:
    ['assets/followers/nhunggumiho/nhunggumiho1.jpg', 'assets/followers/nhunggumiho/nhunggumiho2.jpg',
      'assets/followers/nhunggumiho/nhunggumiho3.jpg', 'assets/followers/nhunggumiho/nhunggumiho4.jpg',
      'assets/followers/nhunggumiho/nhunggumiho5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/messi/messi1.jpg',
        name:  'Messi',
        address: 'Argentina',
        posts: 5,followers: 355,following: 999,isFollow: true,messenger: "Xin chào tôi là Leo Messi",
        time: 9,isOnline: false,Unread: 0,listImages:
    ['assets/followers/messi/messi1.jpg', 'assets/followers/messi/messi2.jpg',
      'assets/followers/messi/messi3.jpg ','assets/followers/messi/messi4.jpg',
      'assets/followers/messi/messi5.jpg']
    ),
    Followers(
        avatar: 'assets/followers/phuongthao/vuphuongthao1.jpg',
        name:  'Vũ Phương Thảo',
        address: 'Hà Nội',
        posts: 5,followers: 111,following: 222,isFollow: false,messenger: "Xin chào tôi là Vũ Phương Thảo",
        time: 9,isOnline: false,Unread: 0,listImages:
    ['assets/followers/phuongthao/vuphuongthao1.jpg', 'assets/followers/phuongthao/vuphuongthao2.jpg',
      'assets/followers/phuongthao/vuphuongthao3.jpg','assets/followers/phuongthao/vuphuongthao4.jpg',
      'assets/followers/phuongthao/vuphuongthao5.jpg']
    ),
  ];

}
