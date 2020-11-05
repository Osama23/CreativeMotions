// To parse this JSON data, do
//
//     final actors = actorsFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

Actors actorsFromJson(String str) => Actors.fromJson(json.decode(str));

String actorsToJson(Actors data) => json.encode(data.toJson());

class Actors {
  Actors({
    this.status,
    this.data,
    this.message,
  });

  int status;
  Data data;
  String message;

  factory Actors.fromJson(Map<String, dynamic> json) => Actors(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.user,
    this.banner,
    this.followers,
    this.posts,
  });

  User user;
  List<Banner> banner;
  List<Follower> followers;
  List<Post> posts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        followers: List<Follower>.from(
            json["followers"].map((x) => Follower.fromJson(x))),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.id,
    this.image,
  });

  int id;
  String image;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Follower {
  Follower({
    this.id,
    this.userName,
    this.image,
  });

  int id;
  String userName;
  String image;

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
        id: json["id"],
        userName: json["user_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "image": image,
      };
}

class Post {
  Post({
    this.id,
    this.userName,
    this.userImage,
    this.bio,
    this.postImage,
    this.postLikes,
    this.postComment,
    this.postShare,
  });

  int id;
  String userName;
  String userImage;
  String bio;
  String postImage;
  String postLikes;
  String postComment;
  String postShare;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userName: json["user_name"],
        userImage: json["user_image"],
        bio: json["bio"],
        postImage: json["post_image"],
        postLikes: json["post_likes"],
        postComment: json["post_comment"],
        postShare: json["post_share"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "user_image": userImage,
        "bio": bio,
        "post_image": postImage,
        "post_likes": postLikes,
        "post_comment": postComment,
        "post_share": postShare,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}


Actors sucssessResponseAllActors(String data) {
  return actorsFromJson(data);
}

abstract class ActorsRepositry {
  Future<Actors> getAllActorsList(context, http.Client client);
}

