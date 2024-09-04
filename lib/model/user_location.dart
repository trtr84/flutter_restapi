// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserLocation {
  final int number;
  final String name;

  UserLocation({required this.number, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'name': name,
    };
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      number: map['street']['number'] as int,
      name: map['street']['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocation.fromJson(String source) =>
      UserLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
