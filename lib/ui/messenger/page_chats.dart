import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/ui/messenger/messenger.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/button_search.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';
import 'package:flutter_social/widgets/icon_avatar.dart';

import '../../objects/item_user.dart';

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
          _buildBodyPage(listUserChat)
        ],
      ),),
    );
  }
  Widget _buildBodyPage(List<UserChat> list){
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
      children: List.generate(list.length, (index) {
          return _buildItemListView(list, index);
      }),
    ),
        ));
  }
  Widget _buildItemListView(List<UserChat> list, int index){
    UserChat userChat = list[index];
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

  Widget _buildUnRead(UserChat userChat) {
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

  Widget _buildInfoItem(UserChat userChat) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userChat.name, style: TextStyle(color: textColor, fontSize: mySize(14)),),
            Text(userChat.messenger, style: TextStyle(color: userChat.Unread ==0 ? subtextColor: textColor, fontSize: mySize(12)),),
          ],
        );
  }

  Widget _buildAvatarItem(UserChat userChat) {
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
  List<UserChat> listUserChat = [
    UserChat('assets/followers/iniesta.jpg', 'Andrés Iniesta', 'xin chào', 16, true,2),
    UserChat('assets/followers/khangan.jpg', "Khả Ngân", "Sài Gòn ", 8, false,5),
    UserChat('assets/followers/khanhvan.jpg', "Khánh Vân", "Mình đến từ Buôn Ma Thuật", 10, false,0),
    UserChat('assets/followers/nhunggumiho.jpg', 'Nhung Gumiho', 'Quảng Nam', 10, false,0),
    UserChat('assets/followers/phuonganh.jpg', "Phương Anh Bolero ", 'Sài Gòn', 13, true,7),
    UserChat('assets/followers/quynhtrang.jpg', "Quỳnh Trang Bolero", 'Sài Gòn', 20, true,1),
    UserChat('assets/followers/ronaldo.jpg', 'Ronaldo', 'Portugal', 6, false,1),
    UserChat('assets/followers/sungha.jpg', "Sung Ha", 'Nghe An', 22, false,0),
    UserChat('assets/followers/vuphuongthao.jpg', 'Vũ Phương Thảo', 'Hà Nội ', 15, true,2),
    UserChat('assets/followers/xavi.jpg', "XaVi", "Spain", 8.5, true,3),
  ];
}
