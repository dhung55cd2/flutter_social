import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/widgets/custom_avatar.dart';

class AvatarItem extends StatelessWidget {
   final Followers userChat;

  const AvatarItem({Key key, this.userChat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

}
