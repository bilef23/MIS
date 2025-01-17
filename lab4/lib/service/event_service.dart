// lib/service/event_service.dart
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../models/location_model.dart';

class EventService with ChangeNotifier {
  // Example data for events
  List<Event> _events = [
    Event(
      id: '1',
      name: 'Math Exam',
      dateTime: DateTime(2025, 5, 18, 9, 0),
      location: Location(latitude: 40.748817, longitude: -73.985428, address: 'Room 101, Building A'),
    ),
    Event(
      id: '2',
      name: 'History Exam',
      dateTime: DateTime(2025, 5, 19, 14, 0),
      location: Location(latitude: 34.052235, longitude: -118.243683, address: 'Room 202, Building B'),
    ),
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
