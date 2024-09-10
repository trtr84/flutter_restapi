import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user/user.dart';

class UserApi {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=20"),
    );
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final transformed = result.map((e) {
      return User.fromMap(e);
    }).toList();
    return transformed;
  }
}
