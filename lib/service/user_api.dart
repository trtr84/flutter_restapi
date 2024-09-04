import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserApi {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=20"),
    );
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final transformed = result.map(
      (e) {
        final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
        );
        final location = Street(
            number: e['location']['street']['number'],
            name: e['location']['street']['name']);
        return User(name, location, gender: e['gender'], email: e['email']);
      },
    ).toList();
    final users = transformed;
    return users;
  }
}
