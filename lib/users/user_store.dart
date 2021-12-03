import 'package:honey_island/users/user.dart';
import 'package:honey_island/users/user_repository.dart';

class UserStore implements UserRepository {
  const UserStore();

  @override
  Future<List<User>> getUsers() {
    return Future.value([
      User(id: '1', name: 'Felipe'),
      User(id: '2', name: 'Aninha'),
      User(id: '3', name: 'Mineiro'),
      User(id: '4', name: 'Sandri'),
      User(id: '5', name: 'Luan'),
      User(id: '6', name: 'Fer')
    ]);
  }
}