import 'package:flutter_restapi/model/user/user_date_of_birthday.dart';
import 'package:flutter_restapi/model/user/user_location.dart';
import 'package:flutter_restapi/model/user/user_name.dart';
import 'package:flutter_restapi/model/user/user_picture.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String gender;
  

  @HiveField(1)
  final String email;

  @HiveField(2)
  final UserName name;

  @HiveField(3)
  final UserLocation location;

  @HiveField(4)
  final UserDateOfBirthday dob;


  User(this.name, this.location, this.dob,
      {required this.gender, required this.email});

  String fullName() {
    return 'Name: $name, E-mail: $email, Address: ${location.name}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDateOfBirthday.fromMap(e['dob']);
    return User(name, location, dob,
        gender: e['gender'], email: e['email']);
  }
}
