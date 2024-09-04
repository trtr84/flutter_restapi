import 'package:flutter_restapi/model/user_date_of_birthday.dart';
import 'package:flutter_restapi/model/user_location.dart';
import 'package:flutter_restapi/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final UserName name;
  final UserLocation location;
  final UserDateOfBirthday dob;

  User(this.name, this.location, this.dob,
      {required this.gender, required this.email});

  String fullName() {
    return 'Name: $name, E-mail: $email, Address: ${location.name}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final location = UserLocation.fromMap(e['location']);
    // final dateBirthday = e['dob']['date'];
    final dob = UserDateOfBirthday.fromMap(e['dob']);
    return User(name, location, dob, gender: e['gender'], email: e['email']);
  }
}
