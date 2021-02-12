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
  bool isFollow;

  Followers(this.avatar, this.name, this.address, this.posts, this.followers, this.isFollow);


}
