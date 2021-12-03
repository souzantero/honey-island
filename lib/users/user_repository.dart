import 'package:honey_island/users/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
