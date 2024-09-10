import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi/model/user/user.dart';
import 'package:flutter_restapi/model/user/user_date_of_birthday.dart';
import 'package:flutter_restapi/model/user/user_location.dart';
import 'package:flutter_restapi/model/user/user_name.dart';
import 'package:flutter_restapi/service/user_service.dart';
import 'package:get_it/get_it.dart';

import '../controllers/controllers.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  static const List<String> _listGender = ['Female', 'Male'];
  late final String selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: const Text('Database screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDropdown<String>(
                hintText: 'Select gender',
                decoration: CustomDropdownDecoration(
                    closedBorder: Border.all(style: BorderStyle.solid),
                    closedFillColor: Colors.transparent,
                    listItemStyle: const TextStyle(fontSize: 18),
                    hintStyle:
                        const TextStyle(fontSize: 22, color: Colors.grey),
                    headerStyle: const TextStyle(fontSize: 18)),
                items: _listGender,
                onChanged: (value) {
                  print('changing value to: $value');
                  selectedGender = value!;
                },
                validateOnChange: true,
                validator: (value) => value == null ? "Must not be null" : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Email',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              controller: textControllerEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Name',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              controller: textControllerName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              keyboardType: TextInputType.streetAddress,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Location',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              controller: textControllerLocation,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Age',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              controller: textControllerAge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
                onPressed: () {
                  final userService = GetIt.instance<UserService>();
                  final firstName = textControllerName.text.split(' ').first;
                  final secondName = textControllerName.text.split(' ')[1];
                  final newUser = User(
                      UserName(first: firstName, last: secondName),
                      UserLocation(name: textControllerLocation.text),
                      UserDateOfBirthday(
                        age: int.parse(textControllerAge.text),
                      ),
                      gender: selectedGender,
                      email: textControllerEmail.text);
                  userService.addUsers(newUser);
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'Record data',
                  style: TextStyle(fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
