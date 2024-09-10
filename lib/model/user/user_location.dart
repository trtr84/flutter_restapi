// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserLocation {
  final String name;

  UserLocation({required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      name: map['street']['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocation.fromJson(String source) =>
      UserLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
