import 'package:flutter/material.dart';
import 'package:flutter_restapi/screens/database.dart';
import 'package:flutter_restapi/screens/home.dart';
import 'package:flutter_restapi/screens/users.dart';

void main() {
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
        '/database': (context) => const DatabaseScreen(),
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
