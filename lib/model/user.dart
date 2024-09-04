class User {
  final String gender;
  final String email;
  final UserName name;
  final Street userLocation;

  User(this.name, this.userLocation, {required this.gender, required this.email});
}
class UserName{
  final String title;
  final String first;
  final String last;

  UserName({required this.title, required this.first, required this.last});
}
class UserLocation {
  final Street street;

  UserLocation({required this.street});
}

class Street {
  final int number;
  final String name;

  Street({required this.number, required this.name});
}