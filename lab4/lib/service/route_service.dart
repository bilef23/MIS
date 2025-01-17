// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class RouteService {
//   Future<Polyline> getRoute(Position currentPosition, LatLng destination) async {
//     List<LatLng> polylineCoordinates = [];
//     PolylinePoints polylinePoints = PolylinePoints();
//
//     var result = await polylinePoints.getRouteBetweenCoordinates(
//       "YOUR_GOOGLE_API_KEY",
//       PointLatLng(currentPosition.latitude, currentPosition.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );
//
//     if (result.status == "OK") {
//       for (var point in result.points) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       }
//     }
//     return Polyline(
//       polylineId: PolylineId('route'),
//       points: polylineCoordinates,
//       color: Colors.blue,
//       width: 5,
//     );
//   }
// }
