import 'package:flutter/material.dart';
import 'package:flutter_restapi/model/user.dart';
import 'package:flutter_restapi/service/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> users;
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'Home screen',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.userLocation.number.toString()),
              subtitle: Text(user.gender),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // child: Image.network('${user['picture']['medium']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
