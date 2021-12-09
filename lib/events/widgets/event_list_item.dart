import 'package:flutter/material.dart';
import 'package:honey_island/events/models/event.dart';

class EventListItem extends StatelessWidget {
  final Event event;
  const EventListItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.event),
      title: Text(event.name),
      subtitle: Text(event.description),
      trailing: Text(event.startDate.toString()),
    );
  }
}