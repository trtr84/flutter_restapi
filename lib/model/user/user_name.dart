// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserName {
  final String first;
  final String last;

  UserName({required this.first, required this.last});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first': first,
      'last': last,
    };
  }

  factory UserName.fromMap(Map<String, dynamic> map) {
    return UserName(
      first: map['first'] as String,
      last: map['last'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserName.fromJson(String source) =>
      UserName.fromMap(json.decode(source) as Map<String, dynamic>);
}
