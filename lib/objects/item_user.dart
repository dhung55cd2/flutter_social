class User {
  final String avatar;
  final String name;
  final double time;
  final String image;

  User({this.avatar, this.name, this.time, this.image});
}
class Followers {
  final String avatar;
  final String name;
  final String address;
  final int posts;
  final int followers;
  final int following;
  bool isFollow;
  final List<String> listImages;


  Followers(
      this.avatar,
      this.name,
      this.address,
      this.posts,
      this.followers,
      this.following,
      this.isFollow,
      this.listImages);


}
class UserChat{
  final String avatar;
  final String name;
  final String messenger;
  final double time;
  final bool isOnline;
  final int Unread;

  UserChat(this.avatar, this.name, this.messenger, this.time, this.isOnline, this.Unread);
}