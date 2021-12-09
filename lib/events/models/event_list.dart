import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/events/models/event.dart';
import 'package:honey_island/events/repositories/event_repository.dart';

class EventList extends ChangeNotifier {
  final EventRepository _repository;
  final List<Event> _events = [];

  EventList({
    required EventRepository repository
  }) : _repository = repository;

  UnmodifiableListView<Event> get events => UnmodifiableListView(_events);
}