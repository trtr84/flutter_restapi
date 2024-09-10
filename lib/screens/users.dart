import 'package:flutter/material.dart';
import 'package:flutter_restapi/model/user/user.dart';
import 'package:flutter_restapi/service/user_api.dart';
import 'package:flutter_restapi/service/user_service.dart';
import 'package:get_it/get_it.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  // List<User> users = [];
  final userService = GetIt.instance<UserService>();

  @override
  void initState() {
    fetchUsers();

    super.initState();
  }

  Future<void> fetchUsers() async {
    try {
      final usersResult = await UserApi().fetchUsers();
      userService.setUsers(usersResult);
      setState(() {});
    } catch (e) {
      print('Error fetching users: $e');
    }
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed('/addUsers');
          if (result == true) {
            setState(() {});
          }
        },
        child: const Icon(Icons.person_add),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: userService.users.length,
        itemBuilder: (context, index) {
          final user = userService.users[index];
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
              // child: Image.network(user.userPicture.thumbnail),
            ),
          );
        },
      ),
    );
  }
}
