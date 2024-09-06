import 'package:flutter_restapi/model/user/user_date_of_birthday.dart';
import 'package:flutter_restapi/model/user/user_location.dart';
import 'package:flutter_restapi/model/user/user_name.dart';
import 'package:flutter_restapi/model/user/user_picture.dart';

class User {
  final String gender;
  final String email;
  final UserName name;
  final UserLocation location;
  final UserDateOfBirthday dob;
  final UserPicture userPicture;

  User(this.name, this.location, this.dob, this.userPicture,
      {required this.gender, required this.email});

  String fullName() {
    return 'Name: $name, E-mail: $email, Address: ${location.name}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDateOfBirthday.fromMap(e['dob']);
    final pictures = UserPicture.fromMap(e['picture']);
    return User(name, location, dob, pictures,
        gender: e['gender'], email: e['email']);
  }
}
