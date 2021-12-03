import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/guys/guys_member.dart';
import 'package:honey_island/guys/guys_repository.dart';

class GuysList extends ChangeNotifier {
  final GuysRepository repository;

  final List<GuysMember> _guys = [
    GuysMember(id: 1, name: 'Felipe'),
    GuysMember(id: 2, name: 'Aninha'),
    GuysMember(id: 3, name: 'Mineiro'),
    GuysMember(id: 4, name: 'Sandri'),
    GuysMember(id: 5, name: 'Luan'),
    GuysMember(id: 6, name: 'Fer')
  ];

  GuysList({required this.repository});

  UnmodifiableListView<GuysMember> get guys => UnmodifiableListView(_guys);
}