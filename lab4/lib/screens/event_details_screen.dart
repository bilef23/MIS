import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name)),
      body: Column(
        children: [
          Text("Date: ${event.dateTime}"),
          Text("Location: ${event.location.address}"),
          // Additional details here
        ],
      ),
    );
  }
}
