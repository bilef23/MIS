import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  final Set<Marker> markers;

  MapWidget({required this.markers});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 14,
      ),
      markers: markers,
    );
  }
}
