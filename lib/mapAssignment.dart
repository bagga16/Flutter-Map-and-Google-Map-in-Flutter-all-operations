// // import 'dart:async';
// // import 'dart:collection';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';
// // import 'package:latlong2/latlong.dart';

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key});

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   StreamController<void> _rebuildStream = StreamController.broadcast();
// //   List<WeightedLatLng> data = [];
// //   List<Map<double, MaterialColor>> gradients = [
// //     HeatMapOptions.defaultGradient,
// //     // {0.25: Colors.blue, 0.55: Colors.red, 0.85: Colors.pink, 1.0: Colors.purple}
// //   ];

// //   var index = 1;

// //   @override
// //   void initState() {
// //     _loadData();
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     _rebuildStream.close();
// //     super.dispose();
// //   }

// //   _loadData() {
// //     List<MapEntry<LatLng, double>> result = [
// //       MapEntry(LatLng(28.430300, 70.300885), 1),
// //       MapEntry(LatLng(28.418790, 70.329942), 1),
// //       MapEntry(LatLng(28.388559, 70.361828), 1),
// //       MapEntry(LatLng(28.425469, 70.299081), 1),
// //       MapEntry(LatLng(28.483621, 70.346547), 1),
// //       MapEntry(LatLng(28.305271, 70.2906253), 1),
// //       MapEntry(LatLng(28.423398, 70.259503), 5),
// //       MapEntry(LatLng(28.418222, 70.278912), 5),
// //     ];

// //     List<LatLng> points = result.map((entry) {
// //       return LatLng(entry.key.latitude, entry.key.longitude);
// //     }).toList();

// //     List<double> weights = result.map((entry) {
// //       return entry.value;
// //     }).toList();

// //     if (points.isNotEmpty) {
// //       data = List.generate(points.length, (index) {
// //         return WeightedLatLng(points[index], weights[index]);
// //       });
// //     }
// //   }

// //   Set<Polygon> _polygons = HashSet<Polygon>();

// //   List<Marker> markers = [];

// //   void addMarker(LatLng position, String imageUrl) {
// //     markers.add(Marker(
// //       width: 40.0,
// //       height: 40.0,
// //       point: position,
// //       builder: (context) => Image.network(
// //         imageUrl,
// //         width: 40.0,
// //         height: 40.0,
// //         color: Colors.red,
// //       ),
// //     ));

// //     setState(() {
// //       markers = [...markers];
// //     });
// //   }

// //   void createPolygonFromMarkers() {
// //     List<LatLng> polygonPoints = markers.map((marker) {
// //       return marker.point;
// //     }).toList();

// //     setState(() {
// //       _polygons.clear();
// //       if (polygonPoints.isNotEmpty) {
// //         _polygons.add(Polygon(
// //           points: polygonPoints,
// //           isDotted: true,
// //           rotateLabel: true,
// //           borderColor: Colors.black,
// //           borderStrokeWidth: 3,
// //         ));
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// //       _rebuildStream.add(null);
// //     });

// //     return Scaffold(
// //       body: Center(
// //         child: Container(
// //           height: MediaQuery.of(context).size.height,
// //           width: MediaQuery.of(context).size.width,
// //           child: FlutterMap(
// //             options: MapOptions(
// //               onTap: (tapPosition, point) {
// //                 addMarker(
// //                   point,
// //                   'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_92x30dp.png',
// //                 );
// //               },
// //               center: LatLng(28.423398, 70.259503),
// //               zoom: 12.0,
// //             ),
// //             children: [
// //               TileLayer(
// //                 urlTemplate:
// //                     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
// //                 subdomains: ['a', 'b', 'c'],
// //               ),
// //               if (data.isNotEmpty)
// //                 HeatMapLayer(
// //                   heatMapDataSource: InMemoryHeatMapDataSource(data: data),
// //                   heatMapOptions: HeatMapOptions(
// //                     radius: 70,
// //                     blurFactor: 0.5,
// //                     layerOpacity: 0.75,
// //                     gradient: {
// //                       0.20: Colors.blue,
// //                       0.30: Colors.red,
// //                       0.50: Colors.yellow,
// //                     },
// //                     minOpacity: 0.1,
// //                   ),
// //                 ),
// //               MarkerLayer(
// //                 markers: markers,
// //               ),
// //               PolygonLayer(
// //                 polygons: _polygons.toList(),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: Column(
// //         mainAxisAlignment: MainAxisAlignment.end,
// //         crossAxisAlignment: CrossAxisAlignment.end,
// //         children: [
// //           FloatingActionButton(
// //             onPressed: () {
// //               createPolygonFromMarkers();
// //             },
// //             tooltip: 'Create Polygon',
// //             child: Icon(Icons.add_location),
// //           ),
// //           SizedBox(height: 13.0),
// //           FloatingActionButton(
// //             onPressed: () {
// //               setState(() {
// //                 _polygons.clear();
// //                 markers.clear();
// //               });
// //             },
// //             tooltip: 'Add Marker',
// //             child: Icon(Icons.delete),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// const LatLng currentLocatoin = LatLng(28.423398, 70.259503);

// class Home_01 extends StatefulWidget {
//   const Home_01({super.key});

//   @override
//   State<Home_01> createState() => _Home_01State();
// }

// class _Home_01State extends State<Home_01> with TickerProviderStateMixin {
//   GlobalKey<ScaffoldState> _globalkey = GlobalKey<ScaffoldState>();
//   final Completer<GoogleMapController> _controller = Completer();
//   final List<Marker> _markers = [];
//   List<LatLng> _latLang = [
//     LatLng(28.430300, 70.290885),
//     LatLng(28.420300, 70.280885),
//     LatLng(28.410300, 70.260885),
//     LatLng(28.400300, 70.250885),
//   ];

//   final List<BitmapDescriptor> markerBitmaps = [];
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   loadData() async {
//     for (int i = 0; i < _latLang.length; i++) {
//       Uint8List? image = await loadNetworkImage(
//           'https://images.pexels.com/photos/1906658/pexels-photo-1906658.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
//       final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
//         image!.buffer.asUint8List(),
//         targetHeight: 200,
//         targetWidth: 200,
//       );
//       final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
//       final ByteData? byteData =
//           await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
//       final Uint8List resizedImageMarker = byteData!.buffer.asUint8List();
//       _markers.add(Marker(
//           markerId: MarkerId(i.toString()),
//           position: _latLang[i],
//           icon: BitmapDescriptor.fromBytes(resizedImageMarker)));

//       setState(() {});
//     }
//   }

//   Future<Uint8List?> loadNetworkImage(String path) async {
//     final completer = Completer<ImageInfo>();
//     var image = NetworkImage(path);
//     image.resolve(ImageConfiguration()).addListener(
//         ImageStreamListener((info, _) => completer.complete(info)));
//     final imageInfo = await completer.future;
//     final byteData =
//         await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
//     return byteData!.buffer.asUint8List();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _globalkey,
//       body: GoogleMap(
//         markers: Set<Marker>.of(_markers),
//         onMapCreated: ((controller) {
//           _controller.complete(controller);
//         }),
//         initialCameraPosition: CameraPosition(
//           target: currentLocatoin,
//           zoom: 13,
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(28.423398, 70.259503);

class Home_01 extends StatefulWidget {
  const Home_01({Key? key}) : super(key: key);

  @override
  _Home_01State createState() => _Home_01State();
}

class _Home_01State extends State<Home_01> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = [];
  List<LatLng> _latLang = [
    LatLng(28.430300, 70.290885),
    LatLng(28.420300, 70.280885),
    LatLng(28.410300, 70.260885),
    LatLng(28.400300, 70.250885),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    for (int i = 0; i < _latLang.length; i++) {
      Uint8List? image = await loadNetworkImage(
          'https://images.pexels.com/photos/1906658/pexels-photo-1906658.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 200,
        targetWidth: 200,
      );
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData =
          await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List resizedImageMarker = byteData!.buffer.asUint8List();

      // Create a circular marker with a radius
      Widget circularMarker = ClipOval(
        child: Image.memory(
          resizedImageMarker,
          width: 40.0, // Set the desired width
          height: 40.0, // Set the desired height
          fit: BoxFit.cover,
        ),
      );

      Uint8List? markerIcon = await getBytesFromWidget(circularMarker);

      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _latLang[i],
        icon: BitmapDescriptor.fromBytes(markerIcon!),
      ));

      setState(() {});
    }
  }

  Future<Uint8List?> loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info)));
    final imageInfo = await completer.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<Uint8List?> getBytesFromWidget(Widget widget) async {
    final GlobalKey key = GlobalKey();
    final RenderRepaintBoundary repaintBoundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await repaintBoundary.toImage(pixelRatio: 3.0);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      // Handle the case where byteData is null
      return null;
    }

    final Uint8List uint8List = byteData.buffer.asUint8List();
    return uint8List;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: GoogleMap(
        markers: Set<Marker>.of(_markers),
        onMapCreated: ((controller) {
          _controller.complete(controller);
        }),
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 13,
        ),
      ),
    );
  }
}
