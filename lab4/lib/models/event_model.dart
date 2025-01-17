import 'package:cloud_firestore/cloud_firestore.dart';
import 'location_model.dart';

class Event {
  final String id;
  final String name;
  final DateTime dateTime;
  final Location location;

  Event({required this.id, required this.name, required this.dateTime, required this.location});

  // Factory constructor to create an Event object from Firestore data
  factory Event.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Event(
      id: doc.id, // Use Firestore document ID as the event ID
      name: data['name'],
      dateTime: (data['dateTime'] as Timestamp).toDate(), // Convert Firestore Timestamp to DateTime
      location: Location.fromMap(data['location']), // Assuming Location has a fromMap method
    );
  }

  // Convert Event to a map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateTime': dateTime,
      'location': location.toMap(), // Assuming Location has a toMap method
    };
  }
}
