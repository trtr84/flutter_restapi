import 'package:flutter_restapi/model/user/user.dart';
import 'package:get_it/get_it.dart';

class UserService {
  List<User> _users = [];
  List<User> get users => _users;
  void addUsers(User user) {
    _users.add(user);
  }

  void setUsers(List<User> newUsers) {
    _users = newUsers;
  }
}

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<UserService>(() => UserService());
}
