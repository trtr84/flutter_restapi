import 'package:flutter/material.dart';
import 'package:flutter_restapi/boxes/boxes.dart';
import 'package:flutter_restapi/model/user/user.dart';
import 'package:flutter_restapi/screens/addUsers.dart';
import 'package:flutter_restapi/screens/home.dart';
import 'package:flutter_restapi/screens/users.dart';
import 'package:flutter_restapi/service/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  personBox = await Hive.openBox<User>('personBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/users': (context) => const UsersScreen(),
        '/addUsers': (context) => const AddUserScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.purple[300],
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
