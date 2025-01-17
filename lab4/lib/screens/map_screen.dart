// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../service/route_service.dart';
//
// class MapScreen extends StatelessWidget {
//   final LatLng destination;
//
//   MapScreen({required this.destination});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Map")),
//       body: FutureBuilder(
//         future: RouteService().getRoute(Position(latitude: 37.7749, longitude: -122.4194), destination),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error loading route"));
//           }
//           return GoogleMap(
//             initialCameraPosition: CameraPosition(target: destination, zoom: 14),
//             polylines: {snapshot.data as Polyline},
//           );
//         },
//       ),
//     );
//   }
// }
