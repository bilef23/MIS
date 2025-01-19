// lib/service/event_service.dart
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../models/location_model.dart';

class EventService with ChangeNotifier {
  // Example data for events
  List<Event> _events = [
    Event(
      id: '1',
      name: 'Web Based Systems',
      dateTime: DateTime(2025, 5, 18, 9, 0),
      location: Location(latitude: 42.00431461188742 , longitude: 21.409589870080953, address: 'Lab 117'),
    ),
    Event(
      id: '2',
      name: 'Probability and Statistics',
      dateTime: DateTime(2025, 5, 19, 14, 0),
      location: Location(latitude: 42.00431461188742 , longitude: 21.409589870080953, address: 'Lab 200AB'),
    ),
    Event(
      id: '3',
      name: 'Data Science',
      dateTime: DateTime(2025, 5, 20, 13, 0),
      location: Location(latitude: 42.00431461188742 , longitude: 21.409589870080953, address: 'Lab 215'),
    )
  ];

  List<Event> get events => _events;

  List<Event> getEventsForDay(DateTime day) {
    // Return events that match the selected day
    return _events.where((event) {
      return event.dateTime.year == day.year &&
          event.dateTime.month == day.month &&
          event.dateTime.day == day.day;
    }).toList();
  }
}
