import 'package:flutter/material.dart';
import 'package:flutter_restapi/model/user/user.dart';
import 'package:flutter_restapi/service/user_api.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  Future<void> fetchUsers() async {
    final usersResult = await UserApi().fetchUsers();
    setState(() {
      users = usersResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Users screen',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(
              'Name: ${user.name.first},\nE-mail: ${user.email},\nAddress: ${user.location.name}',
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              'Age: ${user.dob.age}',
              style: const TextStyle(fontSize: 18),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(user.userPicture.thumbnail),
            ),
          );
        },
      ),
    );
  }
}
