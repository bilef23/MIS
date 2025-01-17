import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import '../models/event_model.dart';
import '../service/event_service.dart';
import 'package:intl/intl.dart'; // For formatting the date/time

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _selectedEvents = ValueNotifier([]);
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Calendar"),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              _loadEventsForSelectedDay();
            },
            eventLoader: (day) {
              return Provider.of<EventService>(context).getEventsForDay(day);
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, events, _) {
                return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return ListTile(
                      title: Text(event.name),
                      subtitle: Text(
                        '${event.location.address}\n${DateFormat('dd/MM/yyyy hh:mm a').format(event.dateTime.toLocal())}',
                      ),
                      onTap: () {
                        _showEventDetails(event);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _loadEventsForSelectedDay() {
    final events = Provider.of<EventService>(context, listen: false)
        .getEventsForDay(_selectedDay);
    _selectedEvents.value = events;
  }

  void _showEventDetails(Event event) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(event.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Location: ${event.location.address}'),
              SizedBox(height: 8.0),
              Text('Date & Time: ${DateFormat('dd/MM/yyyy hh:mm a').format(event.dateTime.toLocal())}'),
              SizedBox(height: 8.0),
              // You can add more details about the event here if needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
