// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class Poly_line extends StatefulWidget {
//   const Poly_line({super.key});

//   @override
//   _Poly_lineState createState() => _Poly_lineState();
// }

// class _Poly_lineState extends State<Poly_line> {
//   List<LatLng> polylinePoints = [
//     LatLng(28.403398, 70.259503),
//     LatLng(28.423398, 70.259503),

//     LatLng(28.448181, 70.282196),
//     LatLng(28.443724, 70.287239),
//     LatLng(28.453724, 70.297239),
//     // Add more points as needed
//   ];

//   List<LatLng> routePoints = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchRoute();
//   }

//   Future<void> _fetchRoute() async {
//     for (int i = 0; i < polylinePoints.length - 1; i++) {
//       List<LatLng> points = await _getRouteBetweenPoints(
//         polylinePoints[i],
//         polylinePoints[i + 1],
//       );

//       if (points.isNotEmpty) {
//         routePoints.addAll(points);
//       }
//     }
//     setState(() {});
//   }

//   Future<List<LatLng>> _getRouteBetweenPoints(
//       LatLng point1, LatLng point2) async {
//     final response = await http.get(
//       Uri.parse(
//         'http://router.project-osrm.org/route/v1/driving/${point1.longitude},${point1.latitude};${point2.longitude},${point2.latitude}?overview=full&steps=true&geometries=geojson',
//       ),
//     );

//     if (response.statusCode == 200) {
//       final decoded = json.decode(response.body);
//       final List<dynamic> routes = decoded['routes'];

//       if (routes.isNotEmpty) {
//         final geometry = routes[0]['geometry']['coordinates'];
//         return geometry.map<LatLng>((coord) {
//           return LatLng(coord[1], coord[0]);
//         }).toList();
//       }
//     }

//     return [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: FlutterMap(
//             options: MapOptions(
//               center: LatLng(28.423398, 70.259503),
//               zoom: 12.0,
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 subdomains: ['a', 'b', 'c'],
//               ),
//               if (routePoints.isNotEmpty)
//                 PolylineLayer(
//                   polylines: [
//                     Polyline(
//                       points: routePoints,
//                       strokeWidth: 4.0,
//                       color: Colors.blue,
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: PolylineGoogleMap(),
  ));
}

class PolylineGoogleMap extends StatefulWidget {
  @override
  _PolylineGoogleMapState createState() => _PolylineGoogleMapState();
}

class _PolylineGoogleMapState extends State<PolylineGoogleMap> {
  late GoogleMapController mapController;
  List<LatLng> polylinePoints = [
    LatLng(28.403398, 70.259503),
    LatLng(28.423398, 70.259503),

    LatLng(28.448181, 70.282196),
    LatLng(28.443724, 70.287239),
    LatLng(28.453724, 70.297239),
    // Add more points as needed
  ];

  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    for (int i = 0; i < polylinePoints.length - 1; i++) {
      List<LatLng> points = await _getRouteBetweenPoints(
        polylinePoints[i],
        polylinePoints[i + 1],
      );

      if (points.isNotEmpty) {
        polylines.add(
          Polyline(
            polylineId: PolylineId(i.toString()),
            points: points,
            color: Colors.blue,
            width: 4,
          ),
        );
      }
    }
    setState(() {});
  }

  Future<List<LatLng>> _getRouteBetweenPoints(
      LatLng point1, LatLng point2) async {
    final response = await http.get(
      Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/${point1.longitude},${point1.latitude};${point2.longitude},${point2.latitude}?overview=full&steps=true&geometries=geojson',
      ),
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List<dynamic> routes = decoded['routes'];

      if (routes.isNotEmpty) {
        final geometry = routes[0]['geometry']['coordinates'];
        return geometry.map<LatLng>((coord) {
          return LatLng(coord[1], coord[0]);
        }).toList();
      }
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(28.423398, 70.259503),
          zoom: 12.0,
        ),
        polylines: polylines,
      ),
    );
  }
}
