import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/users/user.dart';
import 'package:honey_island/users/user_entity.dart';
import 'package:honey_island/users/user_repository.dart';

class UserList extends ChangeNotifier {
  final UserRepository repository;

  final List<User> _users = [];
  
  bool _isLoading = false;

  UserList({required this.repository}) {
    _loadUsers();
  }

  bool get isLoading => _isLoading;

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  Future<void> _loadUsers() async {
    try {
      _isLoading = true;
      notifyListeners();

      final List<UserEntity> fetchedUsers = await repository.getUsers();
      _users.clear();
      _users.addAll(fetchedUsers.map((userEntity) => User.fromEntity(userEntity)));
    } finally {
      _isLoading = false;
      notifyListeners();  
    }
  }
}