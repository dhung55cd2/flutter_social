import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/messenger/messenger.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/button_search.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';


class PageChats extends StatefulWidget {
  @override
  _PageChatsState createState() => _PageChatsState();
}

class _PageChatsState extends State<PageChats> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(height: size.height,width: size.width,
      child: Column(
        children: [
          _buildAppBar(size),
          ButtonSearch(),
          SizedBox(height: myHeight(10),),
          _buildBodyPage(listFollowers)
        ],
      ),),
    );
  }
  Widget _buildBodyPage(List<Users> list){
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
      children: List.generate(list.length, (index) {
          return _buildItemListView(list, index);
      }),
    ),
        ));
  }
  Widget _buildItemListView(List<Users> list, int index){
    Users userChat = list[index];
    return MaterialButton( padding: EdgeInsets.all(0),
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>Messenger(userChat: userChat,)));
      },
      child: Container(
        height: myHeight(72),width: myWidth(335),alignment: Alignment.centerLeft,margin: EdgeInsets.symmetric(vertical: myHeight(10)),
        decoration: BoxDecoration(color: Colors.white,boxShadow: [
          BoxShadow(offset: Offset(1,1),blurRadius: myRadius(1),color: Colors.grey[100]),
          BoxShadow(offset: Offset(-1,-1),blurRadius: myRadius(1),color: Colors.grey[100])
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _buildAvatarItem(userChat),
                SizedBox(width: myWidth(17),),
                _buildInfoItem(userChat),
              ],
            ),
            _buildUnRead(userChat)
          ],
        ),

      ),
    );
  }

  Widget _buildUnRead(Users userChat) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userChat.time.toString()+"feb",style: TextStyle(color: subtextColor, fontSize: mySize(10)),),
            SizedBox(height: myHeight(6.5),),
            userChat.Unread ==0 ? SizedBox() :CircleAvatar(radius: myHeight(10),backgroundColor: color_pink,
            child: Text(userChat.Unread.toString(),style: TextStyle(color: Colors.white,fontSize: mySize(12)),),)
          ],
        );
  }

  Widget _buildInfoItem(Users userChat) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userChat.name, style: TextStyle(color: textColor, fontSize: mySize(14)),),
            Text(userChat.messenger, style: TextStyle(color: userChat.Unread ==0 ? subtextColor: textColor, fontSize: mySize(12)),),
          ],
        );
  }

  Widget _buildAvatarItem(Users userChat) {
    return Container(height: myHeight(40),width: myWidth(40),
          child: Stack(
            children: [
              CustomAvatar(outsideradius: 20,insideradius: 20,images: userChat.avatar,),
             userChat.isOnline ? Positioned(top: myHeight(1),left: myWidth(31),
                child:CircleAvatar(
                  radius: 4,backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 2.5,backgroundColor: color_icon_online,
                  ),
                )
              ) : SizedBox()
            ],
          ),
        );
  }
  Widget _buildAppBar(Size size){
    return Container(
      width: size.width,height: myHeight(137),
      child: Stack(
        children: [
          Positioned(top: myHeight(64),left: myWidth(20),
              child: Text("Chats",style: TextStyle(color: textColor, fontSize: mySize(34)),)),
          Positioned(top: myHeight(73),left: myWidth(268),
              child: Container(height: myHeight(23),width: myWidth(25),child: Image.asset('assets/icons/photo-camera.png'),)),
          Positioned(top: myHeight(64),left: myWidth(315),child: AvatarIcon())
        ],
      ),
    );
  }
  List<Users> listFollowers = [
    Users(
        avatar: 'assets/followers/iniesta/iniesta1.jpg',
        name:  'Andrés Iniesta',
        address: 'Spain',
        posts: 5,followers: 200,following: 999,isFollow: false,messenger: "Xin chào tôi là Iniesta",
        time: 16,isOnline: true,Unread: 2,listImages:
    ['assets/followers/iniesta/iniesta1.jpg', 'assets/followers/iniesta/iniesta2.jpg',
      'assets/followers/iniesta/iniesta3.jpg', 'assets/followers/iniesta/iniesta4.jpg',
      'assets/followers/iniesta/iniesta5.jpg']
    ),
    Users(
        avatar: 'assets/followers/khangan/khangan1.jpg',
        name:  'Khả Ngân',
        address: 'Sài Gòn',
        posts: 5,followers: 310,following: 151,isFollow: false,messenger: "Xin chào tôi là Khả Ngân",
        time: 8,isOnline: false,Unread: 5,listImages:
    ['assets/followers/khangan/khangan1.jpg', 'assets/followers/khangan/khangan2.jpg',
      'assets/followers/khangan/khangan3.jpg', 'assets/followers/khangan/khangan4.jpg',
      'assets/followers/khangan/khangan5.jpg']
    ),
    Users(
        avatar: 'assets/followers/ronaldinho/ronaldinho1.jpg',
        name:  'Ronaldinho',
        address: 'Brazil',
        posts: 5,followers: 399,following: 100,isFollow: true,messenger: "Xin chào tôi là Ronaldinho",
        time: 9,isOnline: false,Unread: 0,listImages:
    ['assets/followers/ronaldinho/ronaldinho1.jpg', 'assets/followers/ronaldinho/ronaldinho2.jpg',
      'assets/followers/ronaldinho/ronaldinho3.jpg', 'assets/followers/ronaldinho/ronaldinho4.jpg',
      'assets/followers/ronaldinho/ronaldinho5.jpg']
    ),
    Users(
        avatar: 'assets/followers/khanhvan/khanhvan1.jpg',
        name:  'Đỗ Khánh Vân',
        address: 'Buôn Ma Thuật',
        posts: 5,followers: 201,following: 105,isFollow: false,messenger: "Xin chào tôi là Đỗ Khánh Vân",
        time: 15,isOnline: false,Unread: 0,listImages:
    ['assets/followers/khanhvan/khanhvan1.jpg', 'assets/followers/khanhvan/khanhvan2.png',
      'assets/followers/khanhvan/khanhvan3.jpg', 'assets/followers/khanhvan/khanhvan4.jpg',
      'assets/followers/khanhvan/khanhvan5.jpg']
    ),
    Users(
        avatar: 'assets/followers/ronaldo/ronaldo1.jpg',
        name:  'Ronaldo Cr7',
        address: 'Portugal',
        posts: 5,followers: 501,following: 999,isFollow: false,messenger: "Xin chào tôi là Ronaldo Cr7",
        time: 9,isOnline: true,Unread: 3,listImages:
    ['assets/followers/ronaldo/ronaldo1.jpg', 'assets/followers/ronaldo/ronaldo2.jpg',
      'assets/followers/ronaldo/ronaldo3.jpg', 'assets/followers/ronaldo/ronaldo4.jpg',
      'assets/followers/ronaldo/ronaldo5.jpg']
    ),
    Users(
        avatar: 'assets/followers/nhunggumiho/nhunggumiho1.jpg',
        name:  'Nhung Gumiho',
        address: 'Quảng Nam',
        posts: 5,followers: 201,following: 300,isFollow: true,messenger: "Xin chào tôi là Nhung Gumiho",
        time: 14.5,isOnline: false,Unread: 0,listImages:
    ['assets/followers/nhunggumiho/nhunggumiho1.jpg', 'assets/followers/nhunggumiho/nhunggumiho2.jpg',
      'assets/followers/nhunggumiho/nhunggumiho3.jpg', 'assets/followers/nhunggumiho/nhunggumiho4.jpg',
      'assets/followers/nhunggumiho/nhunggumiho5.jpg']
    ),
    Users(
        avatar: 'assets/followers/messi/messi1.jpg',
        name:  'Messi',
        address: 'Argentina',
        posts: 5,followers: 355,following: 999,isFollow: true,messenger: "Xin chào tôi là Leo Messi",
        time: 9,isOnline: false,Unread: 0,listImages:
    ['assets/followers/messi/messi1.jpg', 'assets/followers/messi/messi2.jpg',
      'assets/followers/messi/messi3.jpg ','assets/followers/messi/messi4.jpg',
      'assets/followers/messi/messi5.jpg']
    ),
    Users(
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
