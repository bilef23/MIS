// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/calendar_screen.dart';
import 'service/event_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventService()),
      ],
      child: MaterialApp(
        title: 'Event Calendar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CalendarScreen(),
      ),
    );
  }
}
