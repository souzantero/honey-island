import 'package:flutter/widgets.dart';
import 'package:honey_island/events/models/event_list.dart';
import 'package:honey_island/events/widgets/event_list_item.dart';
import 'package:provider/provider.dart';

class EventListView extends StatelessWidget {
  const EventListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventList = Provider.of<EventList>(context);
    final events = eventList.events;
    
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventListItem(event: events[index]);
      },
    );
  }
}