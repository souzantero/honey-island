import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/users/user.dart';
import 'package:honey_island/guys/guys_repository.dart';

class GuysList extends ChangeNotifier {
  final GuysRepository repository;

  final List<User> _guys = [
    User(id: '1', name: 'Felipe'),
    User(id: '2', name: 'Aninha'),
    User(id: '3', name: 'Mineiro'),
    User(id: '4', name: 'Sandri'),
    User(id: '5', name: 'Luan'),
    User(id: '6', name: 'Fer')
  ];

  GuysList({required this.repository});

  UnmodifiableListView<User> get guys => UnmodifiableListView(_guys);
}