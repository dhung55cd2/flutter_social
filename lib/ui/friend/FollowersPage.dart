
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
            _buildBodyPage(context)
          ],
        ),
      ),
    );
  }
  Widget _buildBodyPage(BuildContext context){
    return Expanded(child:
        SingleChildScrollView(
          child: Column(
            children: List.generate(listFollowers.length, (index) {
              return _buildItemBodyPage(listFollowers,index,context);
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
    Followers('assets/followers/iniesta/iniesta1.jpg', 'Andrés Iniesta','Spain',5 , 200, 999,false,
        ['assets/followers/iniesta/iniesta1.jpg', 'assets/followers/iniesta/iniesta2.jpg',
          'assets/followers/iniesta/iniesta3.jpg', 'assets/followers/iniesta/iniesta4.jpg',
          'assets/followers/iniesta/iniesta5.jpg']),
    Followers('assets/followers/khangan/khangan1.jpg', "Khả Ngân", "Sài Gòn ", 5, 310,151,false,
        ['assets/followers/khangan/khangan1.jpg', 'assets/followers/khangan/khangan2.jpg',
          'assets/followers/khangan/khangan3.jpg', 'assets/followers/khangan/khangan4.jpg',
          'assets/followers/khangan/khangan5.jpg']),
    Followers('assets/followers/ronaldinho/ronaldinho1.jpg', 'Ronaldinho', "Brazil", 5, 999,152,true,
        ['assets/followers/ronaldinho/ronaldinho1.jpg', 'assets/followers/ronaldinho/ronaldinho2.jpg',
          'assets/followers/ronaldinho/ronaldinho3.jpg', 'assets/followers/ronaldinho/ronaldinho4.jpg',
          'assets/followers/ronaldinho/ronaldinho5.jpg']),
    Followers('assets/followers/khanhvan/khanhvan1.jpg', "Khánh Vân", "Buôn Ma Thuật", 5, 122,153,true,
        ['assets/followers/khanhvan/khanhvan1.jpg', 'assets/followers/khanhvan/khanhvan2.png',
          'assets/followers/khanhvan/khanhvan3.jpg', 'assets/followers/khanhvan/khanhvan4.jpg',
          'assets/followers/khanhvan/khanhvan5.jpg']),
    Followers('assets/followers/ronaldo/ronaldo1.jpg', 'Ronaldo', 'Portugal', 5, 999,154,false,
        ['assets/followers/ronaldo/ronaldo1.jpg', 'assets/followers/ronaldo/ronaldo2.jpg',
          'assets/followers/ronaldo/ronaldo3.jpg', 'assets/followers/ronaldo/ronaldo4.jpg',
          'assets/followers/ronaldo/ronaldo5.jpg']),
    Followers('assets/followers/nhunggumiho/nhunggumiho1.jpg', 'Nhung Gumiho', 'Quảng Nam', 5, 199,155,true,
        ['assets/followers/nhunggumiho/nhunggumiho1.jpg', 'assets/followers/nhunggumiho/nhunggumiho2.jpg',
          'assets/followers/nhunggumiho/nhunggumiho3.jpg', 'assets/followers/nhunggumiho/nhunggumiho4.jpg',
          'assets/followers/nhunggumiho/nhunggumiho5.jpg']),
    Followers('assets/followers/messi/messi1.jpg', 'Messi', 'Argentina', 5, 999,156,true,
        ['assets/followers/messi/messi1.jpg', 'assets/followers/messi/messi2.jpg',
          'assets/followers/messi/messi3.jpg ','assets/followers/messi/messi4.jpg',
          'assets/followers/messi/messi5.jpg']),
    Followers('assets/followers/phuongthao/vuphuongthao1.jpg', 'Vũ Phương Thảo', 'Hà Nội', 5, 888,157,true,
        ['assets/followers/phuongthao/vuphuongthao1.jpg', 'assets/followers/phuongthao/vuphuongthao2.jpg',
          'assets/followers/phuongthao/vuphuongthao3.jpg','assets/followers/phuongthao/vuphuongthao4.jpg',
          'assets/followers/phuongthao/vuphuongthao5.jpg']),

  ];
}
