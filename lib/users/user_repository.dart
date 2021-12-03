import 'package:honey_island/users/user.dart';
import 'package:honey_island/users/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
