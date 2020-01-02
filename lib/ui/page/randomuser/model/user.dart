import 'package:hello_flutter/ui/page/randomuser/model/location.dart';
import 'package:hello_flutter/ui/page/randomuser/model/name.dart';
import 'package:hello_flutter/ui/page/randomuser/model/picture.dart';

class User {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Picture picture;

  User(this.gender, this.name, this.location, this.email, this.picture);

  User.fromJson(Map<String, dynamic> json)
      : gender = json["gender"],
        name = Name.fromJson(json["name"]),
        location = Location.fromJson(json["location"]),
        email = json["email"],
        picture = Picture.fromJson(json["picture"]);
}