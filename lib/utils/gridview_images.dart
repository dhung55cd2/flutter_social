import 'package:flutter/material.dart';
import 'package:flutter_social/objects/item_images.dart';
import 'package:flutter_social/screen/screen_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagesGridView extends StatelessWidget {
  final List<Images> listImages;

  const ImagesGridView({Key key, this.listImages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.symmetric(horizontal: myHeight(20)),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: listImages.length,
          crossAxisSpacing: myWidth(4),
          mainAxisSpacing: myHeight(4),
          itemBuilder: (context, index){
            return _itemCustomGridView(index);
          },
          staggeredTileBuilder: (index){
            return StaggeredTile.count(listImages[index].isVideo ? 2:1 , listImages[index].isVideo ? 2:1);
            //StaggeredTile.count(1, index.isEven ? 3 : 1);
          }),
    ) );
  }
  Widget _itemCustomGridView(int index) {
    return Container(height: myHeight(94),width: myWidth(109),alignment: Alignment.topRight,padding: EdgeInsets.only(top: myHeight(10),right: myWidth(10)),
      decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage(listImages[index].image),fit: BoxFit.cover
      )
      ),child: listImages[index].isVideo ? Image.asset('assets/icons/icon_video.png'): SizedBox(),
    );
  }
}
