// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  UserPicture(
      {required this.large, required this.medium, required this.thumbnail});

  factory UserPicture.fromMap(Map<String, dynamic> map) {
    return UserPicture(
      large: map['large'] as String,
      medium: map['medium'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }
}
