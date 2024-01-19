import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';
import 'package:latlong2/latlong.dart';

class HeatMap extends StatefulWidget {
  const HeatMap({super.key});

  @override
  _HeatMapState createState() => _HeatMapState();
}

class _HeatMapState extends State<HeatMap> {
  StreamController<void> _rebuildStream = StreamController.broadcast();
  List<WeightedLatLng> data = [];
  List<Map<double, MaterialColor>> gradients = [
    HeatMapOptions.defaultGradient,
    // {0.25: Colors.blue, 0.55: Colors.red, 0.85: Colors.pink, 1.0: Colors.purple}
  ];

  var index = 1;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  void dispose() {
    _rebuildStream.close();
    super.dispose();
  }

  _loadData() {
    List<MapEntry<LatLng, double>> result = [
      MapEntry(LatLng(28.430300, 70.300885), 1),
      MapEntry(LatLng(28.418790, 70.329942), 1),
      MapEntry(LatLng(28.388559, 70.361828), 1),
      MapEntry(LatLng(28.425469, 70.299081), 1),
      MapEntry(LatLng(28.483621, 70.346547), 1),
      MapEntry(LatLng(28.305271, 70.2906253), 1),
      MapEntry(LatLng(28.423398, 70.259503), 5),
      MapEntry(LatLng(28.418222, 70.278912), 5),
    ];

    List<LatLng> points = result.map((entry) {
      return LatLng(entry.key.latitude, entry.key.longitude);
    }).toList();

    List<double> weights = result.map((entry) {
      return entry.value;
    }).toList();

    if (points.isNotEmpty) {
      data = List.generate(points.length, (index) {
        return WeightedLatLng(points[index], weights[index]);
      });
    }
  }

  Set<Polygon> _polygons = HashSet<Polygon>();

  List<Marker> markers = [];

  void addMarker(LatLng position, String imageUrl) {
    markers.add(Marker(
      width: 40.0,
      height: 40.0,
      point: position,
      builder: ((context) => Image.network(
            imageUrl,
            width: 40.0,
            height: 40.0,
            color: Colors.red,
          )),
    ));

    setState(() {
      markers = [...markers];
    });
  }

  void createPolygonFromMarkers() {
    List<LatLng> polygonPoints = markers.map((marker) {
      return marker.point;
    }).toList();

    setState(() {
      _polygons.clear();
      if (polygonPoints.isNotEmpty) {
        _polygons.add(Polygon(
          points: polygonPoints,
          isDotted: true,
          rotateLabel: true,
          borderColor: Colors.black,
          borderStrokeWidth: 3,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _rebuildStream.add(null);
    });

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FlutterMap(
            options: MapOptions(
              onTap: (tapPosition, point) {
                addMarker(
                  point,
                  'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_92x30dp.png',
                );
              },
              center: LatLng(28.423398, 70.259503),
              zoom: 12.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              if (data.isNotEmpty)
                HeatMapLayer(
                  heatMapDataSource: InMemoryHeatMapDataSource(data: data),
                  heatMapOptions: HeatMapOptions(
                    radius: 70,
                    blurFactor: 0.5,
                    layerOpacity: 0.75,
                    gradient: {
                      0.20: Colors.blue,
                      0.30: Colors.red,
                      0.50: Colors.yellow,
                    },
                    minOpacity: 0.1,
                  ),
                ),
              MarkerLayer(
                markers: markers,
              ),
              PolygonLayer(
                polygons: _polygons.toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              createPolygonFromMarkers();
            },
            tooltip: 'Create Polygon',
            child: Icon(Icons.add_location),
          ),
          SizedBox(height: 13.0),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _polygons.clear();
                markers.clear();
              });
            },
            tooltip: 'Add Marker',
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  // builder(Image Function(dynamic context) param0) {}
}
