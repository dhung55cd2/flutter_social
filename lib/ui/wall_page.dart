import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_user.dart';
import 'file:///C:/Users/dvhnu/AndroidStudioProjects/flutter_social/lib/widgets/widgets.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_social/ui/social_page.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class WallPage extends StatefulWidget {
  @override
  _WallPageState createState() => _WallPageState();
}

class _WallPageState extends State<WallPage> {
  int _isSelected = 0;
  bool ontapBottomSheet = false;
  bool checkUserReply = false ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(checkUserReply.toString());
    return Scaffold(
      body: Container(
        height: size.height,width: size.width,
        child: Stack(
          children: [
            Column(
              children: [
                _buildAppBar(size),
                SizedBox(height: myHeight(20),),
                    _buildBodyPage(),
              ],
            ),
            checkUserReply ? Positioned(child: _buildUserReply(),top : myHeight(466+55/2),) : SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          setState(() {
            ontapBottomSheet = !ontapBottomSheet;
          });
        },
        child: Container(
            child: ontapBottomSheet ? _buildBottomNavUnHide(size): _buildBottomNavHide(size)),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Expanded(
            child: Container(
              height: myHeight(933),width: myWidth(355),
              child: ListView.builder(itemCount:  listUserTimeLine.length, itemBuilder: (context, index){
                return Column(
                          children: [
                            _itemUser(listUserTimeLine[index].avatar, listUserTimeLine[index].name,
                                listUserTimeLine[index].time, listUserTimeLine[index].image,),
                            SizedBox(height: myHeight(30),),
                          ],
                        );
              })
            ),

    );
  }
  Widget _itemUser(String avatar, String name, double time, String image, ){
    return Container(
      width: myWidth(355),height: myHeight(444),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: myWidth(10),),
              Container(width: myWidth(40),height: myHeight(40),child: Image.asset(avatar,),),
              SizedBox(width: myWidth(10),),
              Text(name, style: TextStyle(color: textColor, fontSize: mySize(14)),),
              SizedBox(width: myWidth(10),),
              Text(time.toString()+"h ago", style: TextStyle(color: subtextColor, fontSize: mySize(14)),)
            ],
          ),
          SizedBox(height: myHeight(10),),
          // image
          Container(
            height: myHeight(275),width: myWidth(355),
              child: Image.asset(image,fit: BoxFit.cover,)),
          SizedBox(height: myHeight(20),),
          _buildRowItemIcon(),
          SizedBox(height: myHeight(20),),
          Container(width: myWidth(335),child: Divider(height: myHeight(0.5),color: colorDivider,)),
          SizedBox(height: myHeight(10.5),),
          Container(
            width: myWidth(335),height: myHeight(19),
            child: Row(
              children: [
                Text("Mark Robertson ", style: TextStyle(color: textColor, fontSize: mySize(14)),),
                Text("Oh wow! Great looking image ", style: TextStyle(color: subtextColor, fontSize: mySize(14)),),
              ],
            )
          ),
          SizedBox(height: myHeight(14),),
          Container(
              width: myWidth(335),height: myHeight(19),
              child: Row(
                children: [
                  Text("Amanda ", style: TextStyle(color: textColor, fontSize: mySize(14)),),
                  Text("I totally love this!", style: TextStyle(color: subtextColor, fontSize: mySize(14)),),
                ],
              )
          ),
        ],
      ),
    );
  }
Widget _buildUserReply(){
    return Container(
      height: myHeight(55),width: myWidth(375),padding: EdgeInsets.symmetric(horizontal: myWidth(10)),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(offset: Offset(1,-1),blurRadius: 10,color: Colors.grey[200]),
    ],color: Colors.white),
      child:
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: textColor, fontSize: mySize(14)),
              prefixIcon: Container(height: myHeight(27),width: myWidth(27),child: Image.asset('assets/images/avatar_reply.png')),
              suffixIcon: InkWell(
                onTap: (){
                  setState(() {
                    checkUserReply = !checkUserReply;
                  });
                },
                  child: Container(height: myHeight(19),width: myWidth(19),child: Image.asset('assets/icons/send-message.png',)))
            ),
          )
    );
}
  Widget _buildRowItemIcon() {
    return Container(
          height: myHeight(16),width: myWidth(335),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconLike(280, false),
              _buildIconReply(25, true),
              _buildIconShare(4,false),
              _buildIconMores()
            ],
          ),
          // 'assets/images/avatar_reply.png',
        );
  }
  Widget _buildIconLike(int countLike, bool checkClick){
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return InkWell(
            onTap: (){
              print(checkClick.toString());
              if(checkClick == false) {
                ++countLike;
              } else {--countLike;}
              setState(() {checkClick = !checkClick;});
              print(checkClick.toString());
            },
            child: Container(
              height: myHeight(16),width: myWidth(72),
              child: Row(
                children: [
                  !checkClick ? Image.asset('assets/icons/like_icon_boder.png',color: textColor,) :Image.asset('assets/icons/like_icon.png',color: color_pink,),
                  Text(" Liked ", style: TextStyle(color: textColor, fontSize: mySize(12)),),
                  Text(countLike.toString(),style: TextStyle(color: subtextColor, fontSize: mySize(12)),)
                ],
              ),
            ),
          );

        }
    );
}
  Widget _buildIconReply(int countReply, bool checkClick){
    return InkWell(
      onTap: (){
       setState(() {
         checkUserReply = !checkUserReply;
       });
      },
      child: Container(
        height: myHeight(16),width: myWidth(84),
        child: Row(
          children: [
            Image.asset('assets/icons/replies.png',color: textColor,),
            Text(" Replies ", style: TextStyle(color: textColor, fontSize: mySize(12)),),
            Text(countReply.toString(),style: TextStyle(color: subtextColor, fontSize: mySize(12)),)
          ],
        ),
      ),
    );
  }
  Widget _buildIconShare(int countShare, bool checkClick){
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => SocialPage()));
            },
            child: Container(
              height: myHeight(16),width: myWidth(74),
              child: Row(
                children: [
                  Image.asset('assets/icons/shares_icon.png',color: textColor,),
                  Text(" Shares ", style: TextStyle(color: textColor, fontSize: mySize(12)),),
                  Text(countShare.toString(),style: TextStyle(color: subtextColor, fontSize: mySize(12)),)
                ],
              ),
            ),
          );

        }
    );
  }
  Widget _buildIconMores(){
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return InkWell(
            onTap: (){
            },
            child: Container(
              height: myHeight(4),width: myWidth(16),alignment: Alignment.centerRight,
              child: Image.asset('assets/icons/more.png',color: textColor),


            ),
          );

        }
    );
  }
  Widget _buildBottomNavHide(Size size){
    return Container(
          height: myHeight(83),width: size.width,alignment: Alignment.topCenter,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(listIconBottomNav.length, (index) {
                  return _widgetIconBottomNavHide(size, listIconBottomNav[index].widget,listIconBottomNav[index].index);
                })
              ),
            ],
          ),
    );

  }
  Widget _buildBottomNavUnHide(Size size) {
    return Container(
      height: myHeight(454),width: myWidth(375),
      child: Column(
        children: [
          SizedBox(height: myHeight(15),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(listIconBottomNav.length, (index) {
                return _widgetIconBottomNavUnHide(size, listIconBottomNav[index].widget,listIconBottomNav[index].index);
              })
          ),
          SizedBox(height: myHeight(17),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: myWidth(20)),alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today", style: TextStyle(color: textColor, fontSize: mySize(20)),),
                SizedBox(height: myHeight(30),),
                itemLikePost('assets/images/avatar_amanda.png',"Amanda",2,Image.asset('assets/images/imagepost.png'),),
                SizedBox(height: myHeight(30),),
                itemFollowingPost('assets/images/avatar_roby.png',"Roby",2,Image.asset('assets/images/imagepost.png'),),
                SizedBox(height: myHeight(30),),
                itemRepliedPost('assets/images/avatar_michael.png',"Miachael",2,Image.asset('assets/images/imagepost.png'),),
                SizedBox(height: myHeight(30),),
                itemLikePost('assets/images/avatar_carrie.png',"Carrie",2,Image.asset('assets/images/imagepost.png'),),
                SizedBox(height: myHeight(30),),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget itemLikePost(String image,String name, int time, Widget widget){
    return Container(
      height: myHeight(40),width: myWidth(335),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: myWidth(40),height: myHeight(40),
                  child: Image.asset(image)),
              SizedBox(width: myWidth(10),),
              Container(width: myWidth(165),height: myHeight(38),alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(text: TextSpan(
                        text: name,style: TextStyle(color: textColor, fontSize: mySize(14)),
                        children: [
                          TextSpan(text: " liked your post\n"+time.toString()+"h ago",style: TextStyle(color: subtextColor, fontSize: mySize(14))),
                        ]
                    )),
                  ],
                ),
              ),
            ],
          ),
          Container(height: myHeight(40),width: myWidth(40),
              child: widget)
        ],
      ),
    );
}
  Widget itemFollowingPost(String image,String name, int time, Widget widget){
    return Container(
      height: myHeight(40),width: myWidth(335),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: myWidth(40),height: myHeight(40),
                  child: Image.asset(image)),
              SizedBox(width: myWidth(10),),
              Container(width: myWidth(165),height: myHeight(38),alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(text: TextSpan(
                        text: name,style: TextStyle(color: textColor, fontSize: mySize(14)),
                        children: [
                          TextSpan(text:" started following\n"+time.toString()+"h ago",style: TextStyle(color: subtextColor, fontSize: mySize(14))),
                        ]
                    )),
                  ],
                ),
              ),
            ],
          ),
          Container(height: myHeight(40),width: myWidth(40),
              child: widget)
        ],
      ),
    );
  }
  Widget itemRepliedPost(String image, String name, int time, Widget widget){
    return Container(
      height: myHeight(55),width: myWidth(335),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: myWidth(40),height: myHeight(40),
                  child: Image.asset(image)),
              SizedBox(width: myWidth(10),),
              Container(width: myWidth(165),height: myHeight(55),alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(text: TextSpan(
                        text: name,style: TextStyle(color: textColor, fontSize: mySize(14)),
                        children: [
                          TextSpan(text: " replied ",style: TextStyle(color: subtextColor, fontSize: mySize(14))),
                          TextSpan(text: " OMG,\n duuude that is neat .\n",style: TextStyle(color: textColor, fontSize: mySize(14))),
                          TextSpan(text: time.toString()+"h ago",style: TextStyle(color: subtextColor, fontSize: mySize(14))),
                        ]
                    )),
                  ],
                ),
              ),
            ],
          ),
          Container(height: myHeight(40),width: myWidth(40),
              child: widget)
        ],
      ),
    );
  }
  Widget _widgetIconBottomNavHide(Size size, Widget widget, int index) {
    return InkWell(
      onTap: (){
       setState(() {
         _isSelected = index;
       });
      },
      child: Container(height: myHeight(49),width: size.width/3,alignment: Alignment.center,
              decoration: BoxDecoration(border:  Border(
                  top: index ==_isSelected ? BorderSide(color: color_blue,width: myHeight(2)):
                  BorderSide(color: Colors.transparent,width: myHeight(0)),
                  )
              ),
              child: widget
      ),
    );
  }
  Widget _widgetIconBottomNavUnHide(Size size, Widget widget, int index) {
    return InkWell(
      onTap: (){
        setState(() {
          _isSelected = index;
        });
      },
      child: Container(height: myHeight(49),width: size.width/3,alignment: Alignment.center,
          decoration: BoxDecoration(border:  Border(
              top: index ==_isSelected ? BorderSide(color: color_blue,width: myHeight(2)):
              BorderSide(color: Colors.transparent,width: myHeight(0)),
              bottom: BorderSide(color:colorDivider))
          ),
          child: widget
      ),
    );
  }
  Widget _buildAppBar(Size size) {
    return Container(
      width: size.width,height: myHeight(115),
      padding: EdgeInsets.only(top: myHeight(64),left: myWidth(20),right: myWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Browse", style: TextStyle(color: textColor, fontSize: mySize(34)),),
          Container(height: myHeight(51),width: myWidth(40),
          child: Stack(
            children: [
              Positioned(bottom: 0,
                  child: Container(height: myHeight(40),width: myWidth(40),
                      child: Image.asset('assets/images/blur.png',))),
              Positioned(top: 0,
                  child: Container(height: myHeight(40),width: myWidth(40),
                      child: Image.asset('assets/images/own_avatar.png',)))
            ],
          ),)
        ],
      ),
    );
  }
  List<CustomWidget> listIconBottomNav = [
    CustomWidget(widget:Image.asset('assets/icons/icon1.png'),index: 0 ),
    CustomWidget(widget:Image.asset('assets/icons/icon2.png'),index: 1 ),
    CustomWidget(widget:
    Container(height: myHeight(25),width: myWidth(45),alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(myRadius(17.5)),color: color_pink,),
      child: Text("20",style: TextStyle(color: Colors.white,fontSize: mySize(12)),),)
        ,index: 2 ),


  ];
  List<People> listUserTimeLine = [
    People(avatar: "assets/images/avatar_friend.png",name:"Andrew Clarkson",time: 2, image:'assets/images/imagepost.png' ),
    People(avatar: "assets/images/avatar_friend_girl.png",name:"Amanda Roberts",time: 3, image:'assets/images/image_girl.png' ),
    People(avatar: "assets/images/avatar_friend.png",name:"Andrew Clarkson",time: 2, image:'assets/images/imagepost.png' ),
    People(avatar: "assets/images/avatar_friend_girl.png",name:"Amanda Roberts",time: 5, image:'assets/images/imagepost.png' ),
  ];
}