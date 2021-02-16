class People {
  final String avatar;
  final String name;
  final double time;
  final String image;
  People({this.avatar, this.name, this.time, this.image});
}
class Users {
  final String avatar;
  final String name;
  final String address;
  final int posts;
  final int followers;
  final int following;
  bool isFollow;
  final List<String> listImages;
  final String messenger;
  final double time;
  bool isOnline;
  final int Unread;

  Users(
      {this.avatar,
    this.name,
    this.address,
    this.posts,
    this.followers,
    this.following,
    this.isFollow,
    this.messenger,
    this.time,
    this.isOnline,
    this.Unread,
    this.listImages,
  });

}
