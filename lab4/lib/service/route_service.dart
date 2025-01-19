import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class RoutingService {
  static const String apiKey = "**************************";
  static const String baseUrl = "https://api.openrouteservice.org/v2/directions/driving-car";

  Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
    final Dio dio = Dio();
    try {
      final response = await dio.post(
        baseUrl,
        options: Options(headers: {"Authorization": apiKey, "Content-Type": "application/json"}),
        data: {
          "coordinates": [
            [start.longitude, start.latitude], // OpenRouteService expects [LONG, LAT]
            [end.longitude, end.latitude]
          ],
          "format": "json"
        },
      );

      final data = response.data;
      String encodedPolyline = data["routes"][0]["geometry"]; // Get encoded polyline

      // ✅ Decode polyline correctly
      PolylinePoints polylinePoints = PolylinePoints();
      List<PointLatLng> decodedPoints = polylinePoints.decodePolyline(encodedPolyline);
      List<LatLng> routePoints = decodedPoints.map((p) => LatLng(p.latitude, p.longitude)).toList();

      return routePoints;
    } catch (e) {
      print("Error fetching route: $e");
      return [];
    }
  }
}
