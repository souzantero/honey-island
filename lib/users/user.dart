import 'package:honey_island/users/user_entity.dart';

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromEntity(UserEntity entity) {
    return User(id: entity.id, name: entity.name);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is User && other.id == id;
}