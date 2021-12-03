import 'package:honey_island/users/user.dart';
import 'package:honey_island/users/user_entity.dart';
import 'package:honey_island/users/user_repository.dart';

class UserStore implements UserRepository {
  const UserStore();

  @override
  Future<List<UserEntity>> getUsers() {
    return Future.value([
      UserEntity(id: '1', name: 'Felipe'),
      UserEntity(id: '2', name: 'Aninha'),
      UserEntity(id: '3', name: 'Mineiro'),
      UserEntity(id: '4', name: 'Sandri'),
      UserEntity(id: '5', name: 'Luan'),
      UserEntity(id: '6', name: 'Fer')
    ]);
  }
}