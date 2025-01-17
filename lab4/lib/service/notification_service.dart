// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     const android = AndroidInitializationSettings('app_icon');
//     final InitializationSettings initSettings = InitializationSettings(android: android);
//
//     await _flutterLocalNotificationsPlugin.initialize(initSettings);
//   }
//
//   Future<void> showNotification(String title, String body) async {
//     const androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);
//
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//     );
//   }
//
//   Future<void> scheduleNotification(
//       int id, String title, String body, DateTime scheduledTime) async {
//     const androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);
//
//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledTime,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
// }
