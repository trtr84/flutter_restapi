// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDateOfBirthday {
  final DateTime date;
  final int age;

  UserDateOfBirthday({required this.date, required this.age});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'age': age,
    };
  }

  factory UserDateOfBirthday.fromMap(Map<String, dynamic> map) {
    return UserDateOfBirthday(
      date: DateTime.parse(map['date']),
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDateOfBirthday.fromJson(String source) => UserDateOfBirthday.fromMap(json.decode(source) as Map<String, dynamic>);
}
