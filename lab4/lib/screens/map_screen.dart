import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../service/route_service.dart'; // Ensure RoutingService is in a separate file

class MapScreen extends StatefulWidget {
  final LatLng startLocation;
  final LatLng eventLocation;
  final String eventName;

  MapScreen({
    required this.startLocation,
    required this.eventLocation,
    required this.eventName,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> routePoints = [];

  @override
  void initState() {
    super.initState();
    _fetchRoute();
  }

  void _fetchRoute() async {
    var routingService = RoutingService();
    List<LatLng> points = await routingService.getRoute(widget.startLocation, widget.eventLocation);
    setState(() {
      routePoints = List.from(points);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Route to ${widget.eventName}")),
      body: FlutterMap(
        options: MapOptions(center: widget.startLocation, zoom: 14.0),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
              point: widget.startLocation,
              width: 40,
              height: 40,
              child: Icon(Icons.my_location, color: Colors.blue),
            ),
              Marker(
                point: widget.eventLocation,
                width: 40,
                height: 40,
                child: Icon(Icons.my_location, color: Colors.red),
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                color: Colors.blue,
                strokeWidth: 4.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
