// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // // // // void main() {
// // // // //   runApp(MyApp());
// // // // // }

// // // // // class MyApp extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       home: MyMapScreen(),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class MyMapScreen extends StatefulWidget {
// // // // //   @override
// // // // //   _MyMapScreenState createState() => _MyMapScreenState();
// // // // // }

// // // // // class _MyMapScreenState extends State<MyMapScreen> {
// // // // //   late GoogleMapController mapController;
// // // // //   Set<Marker> markers = {};
// // // // //   Set<Polygon> polygons = {};

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: GoogleMap(
// // // // //         onMapCreated: (GoogleMapController controller) {
// // // // //           mapController = controller;
// // // // //         },
// // // // //         onTap: _addMarker,
// // // // //         initialCameraPosition: CameraPosition(
// // // // //           target: LatLng(28.423398, 70.259503),
// // // // //           zoom: 12.0,
// // // // //         ),
// // // // //         markers: markers,
// // // // //         polygons: polygons,
// // // // //       ),
// // // // //       floatingActionButton: Column(
// // // // //         mainAxisAlignment: MainAxisAlignment.end,
// // // // //         children: [
// // // // //           FloatingActionButton(
// // // // //             onPressed: () {
// // // // //               _createPolygon();
// // // // //             },
// // // // //             tooltip: 'Create Polygon',
// // // // //             child: Icon(Icons.add_location),
// // // // //           ),
// // // // //           SizedBox(height: 13.0),
// // // // //           FloatingActionButton(
// // // // //             onPressed: () {
// // // // //               setState(() {
// // // // //                 markers.clear();
// // // // //                 polygons.clear();
// // // // //               });
// // // // //             },
// // // // //             tooltip: 'Clear Markers and Polygon',
// // // // //             child: Icon(Icons.delete),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   void _addMarker(LatLng tappedPoint) {
// // // // //     setState(() {
// // // // //       markers.add(
// // // // //         Marker(
// // // // //           markerId: MarkerId(tappedPoint.toString()),
// // // // //           position: tappedPoint,
// // // // //          infoWindow: InfoWindow(
// // // // //             title: 'Marker',
// // // // //             snippet: 'User added marker',
// // // // //           ),
// // // // //         ),
// // // // //       );
// // // // //     });
// // // // //   }

// // // // //   void _createPolygon() {
// // // // //     if (markers.length < 2) {
// // // // //       // Need at least 2 markers to create a polygon
// // // // //       return;
// // // // //     }

// // // // //     List<LatLng> polygonPoints = markers.map((marker) {
// // // // //       return marker.position!;
// // // // //     }).toList();

// // // // //     setState(() {
// // // // //       polygons.add(
// // // // //         Polygon(
// // // // //           polygonId: PolygonId('polygon_id'),
// // // // //           points: polygonPoints,
// // // // //           strokeWidth: 3,
// // // // //           strokeColor: Colors.black,
// // // // //           fillColor: Colors.transparent,
// // // // //         ),
// // // // //       );
// // // // //     });
// // // // //   }
// // // // // }

// // // import 'dart:typed_data';
// // // import 'dart:ui' as ui;

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: MyMapScreen(),
// // //     );
// // //   }
// // // }

// // // class MyMapScreen extends StatefulWidget {
// // //   @override
// // //   _MyMapScreenState createState() => _MyMapScreenState();
// // // }

// // // class _MyMapScreenState extends State<MyMapScreen> {
// // //   late GoogleMapController mapController;
// // //   Set<Marker> markers = {};
// // //   Set<Polygon> polygons = {};

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: GoogleMap(
// // //         onMapCreated: (GoogleMapController controller) {
// // //           mapController = controller;
// // //         },
// // //         onTap: _addMarker,
// // //         initialCameraPosition: CameraPosition(
// // //           target: LatLng(28.423398, 70.259503),
// // //           zoom: 12.0,
// // //         ),
// // //         markers: markers,
// // //         polygons: polygons,
// // //       ),
// // //       floatingActionButton: Column(
// // //         mainAxisAlignment: MainAxisAlignment.end,
// // //         children: [
// // //           FloatingActionButton(
// // //             onPressed: () {
// // //               _createPolygon();
// // //             },
// // //             tooltip: 'Create Polygon',
// // //             child: Icon(Icons.add_location),
// // //           ),
// // //           SizedBox(height: 13.0),
// // //           FloatingActionButton(
// // //             onPressed: () {
// // //               setState(() {
// // //                 markers.clear();
// // //                 polygons.clear();
// // //               });
// // //             },
// // //             tooltip: 'Clear Markers and Polygon',
// // //             child: Icon(Icons.delete),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   void _addMarker(LatLng tappedPoint) {
// // //     _addNetworkImageMarker(
// // //         tappedPoint,
// // //         'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_92x30dp.png',
// // //         'User added marker',
// // //         color: Colors.red,
// // //         // Specify the color

// // //         height: 100,
// // //         width: 100 // Specify the size
// // //         );
// // //   }

// // //   Future<void> _addNetworkImageMarker(
// // //     LatLng position,
// // //     String imageUrl,
// // //     String snippet, {
// // //     Color color = Colors.red,
// // //     double height = 200,
// // //     double width = 200,
// // //   }) async {
// // //     final Uint8List markerIcon = await getBytesFromNetworkImage(
// // //         imageUrl, height.toInt(), width.toInt(), color);
// // //     final BitmapDescriptor customIcon = BitmapDescriptor.fromBytes(markerIcon);

// // //     setState(() {
// // //       markers.add(
// // //         Marker(
// // //           markerId: MarkerId(position.toString()),
// // //           position: position,
// // //           icon: customIcon,
// // //           infoWindow: InfoWindow(
// // //             title: 'Custom Image Marker',
// // //             snippet: snippet,
// // //           ),
// // //         ),
// // //       );
// // //     });
// // //   }

// // //   void _createPolygon() {
// // //     if (markers.length < 2) {
// // //       // Need at least 2 markers to create a polygon
// // //       return;
// // //     }

// // //     List<LatLng> polygonPoints = markers.map((marker) {
// // //       return marker.position;
// // //     }).toList();

// // //     setState(() {
// // //       polygons.add(
// // //         Polygon(
// // //           polygonId: const PolygonId('polygon_id'),
// // //           points: polygonPoints,
// // //           strokeWidth: 3,
// // //           strokeColor: Colors.black,
// // //           fillColor: Colors.transparent,
// // //         ),
// // //       );
// // //     });
// // //   }

// // //   Future<Uint8List> getBytesFromNetworkImage(
// // //       String path, int width, int height, Color color) async {
// // //     // Fetch the image from the network and convert it to bytes
// // //     // Replace this with your own logic to fetch the image
// // //     // Example using Flutter's `http` package:
// // //     // final http.Response response = await http.get(Uri.parse(path));
// // //     // final List<int> imageData = response.bodyBytes;

// // //     // For the sake of example, we're using a placeholder image here
// // //     final ByteData data = await NetworkAssetBundle(Uri.parse(path)).load('');
// // //     final ui.Codec codec =
// // //         await ui.instantiateImageCodec(Uint8List.view(data.buffer));
// // //     final ui.FrameInfo frameInfo = await codec.getNextFrame();
// // //     final ui.Image image = frameInfo.image;

// // //     // Convert the image to bytes with specified color and size
// // //     final recorder = ui.PictureRecorder();
// // //     final canvas = Canvas(recorder);
// // //     final paint = Paint()
// // //       ..colorFilter = ColorFilter.mode(color, BlendMode.srcIn);
// // //     canvas.drawImage(image, Offset(0, 0), paint);

// // //     final img = await recorder.endRecording().toImage(width, height);
// // //     final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
// // //     return byteData!.buffer.asUint8List();
// // //   }
// // // }

// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyMapScreen(),
//     );
//   }
// }

// class MyMapScreen extends StatefulWidget {
//   @override
//   _MyMapScreenState createState() => _MyMapScreenState();
// }

// class _MyMapScreenState extends State<MyMapScreen> {
//   late GoogleMapController mapController;
//   Set<Marker> markers = {};
//   Set<Polygon> polygons = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         onTap: _addMarker,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(28.423398, 70.259503),
//           zoom: 12.0,
//         ),
//         markers: markers,
//         polygons: polygons,
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(left: 25, bottom: 10),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               FloatingActionButton(
//                 onPressed: () {
//                   _createPolygon();
//                 },
//                 tooltip: 'Create Polygon',
//                 child: Icon(Icons.add_location),
//               ),
//               SizedBox(height: 13.0),
//               FloatingActionButton(
//                 onPressed: () {
//                   setState(() {
//                     markers.clear();
//                     polygons.clear();
//                   });
//                 },
//                 tooltip: 'Clear Markers and Polygon',
//                 child: Icon(Icons.delete),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _addMarker(LatLng tappedPoint) {
//     _addNetworkImageMarker(
//       tappedPoint,
//       'https://images.pexels.com/photos/1906658/pexels-photo-1906658.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//       'User added marker',
//     );
//   }

//   Future<void> _addNetworkImageMarker(
//     LatLng position,
//     String imageUrl,
//     String snippet,
//   ) async {
//     final Uint8List markerIcon =
//         await getBytesFromNetworkImage(imageUrl, 100, 100);
//     final BitmapDescriptor customIcon = BitmapDescriptor.fromBytes(markerIcon);

//     setState(() {
//       markers.add(
//         Marker(
//           markerId: MarkerId(position.toString()),
//           position: position,
//           icon: customIcon,
//           infoWindow: InfoWindow(
//             title: 'Custom Image Marker',
//             snippet: snippet,
//           ),
//         ),
//       );
//     });
//   }

//   void _createPolygon() {
//     if (markers.length < 2) {
//       // condition of minimum markers to create a polygon
//       //change acording to requirment
//       return;
//     }

//     List<LatLng> polygonPoints = markers.map((marker) {
//       return marker.position!;
//     }).toList();

//     setState(() {
//       polygons.add(
//         Polygon(
//           polygonId: PolygonId('polygon_id'),
//           points: polygonPoints,
//           strokeWidth: 3,
//           strokeColor: Colors.black,
//           fillColor: Colors.transparent,
//         ),
//       );
//     });
//   }

//   Future<Uint8List> getBytesFromNetworkImage(
//       String path, int width, int height) async {
//     // Fetch the image from the network and convert it to bytes
//     final ByteData data = await NetworkAssetBundle(Uri.parse(path)).load('');
//     return data.buffer.asUint8List();
//   }
// }

//********************circular image

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMapScreen(),
    );
  }
}

class MyMapScreen extends StatefulWidget {
  @override
  _MyMapScreenState createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polygon> polygons = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        onTap: _addMarker,
        initialCameraPosition: CameraPosition(
          target: LatLng(28.423398, 70.259503),
          zoom: 12.0,
        ),
        markers: markers,
        polygons: polygons,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 10),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _createPolygon();
                },
                tooltip: 'Create Polygon',
                child: Icon(Icons.add_location),
              ),
              SizedBox(height: 13.0),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    markers.clear();
                    polygons.clear();
                  });
                },
                tooltip: 'Clear Markers and Polygon',
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addMarker(LatLng tappedPoint) {
    _addNetworkImageMarker(
      tappedPoint,
      'https://images.pexels.com/photos/1906658/pexels-photo-1906658.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'User added marker',
    );
  }

  Future<void> _addNetworkImageMarker(
    LatLng position,
    String imageUrl,
    String snippet,
  ) async {
    final BitmapDescriptor customIcon = await getMarkerImageFromUrl(imageUrl);

    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          icon: customIcon,
          infoWindow: InfoWindow(
            title: 'Custom Image Marker',
            snippet: snippet,
          ),
        ),
      );
    });
  }

  void _createPolygon() {
    if (markers.length < 2) {
      return;
    }

    List<LatLng> polygonPoints = markers.map((marker) {
      return marker.position!;
    }).toList();

    setState(() {
      polygons.add(
        Polygon(
          polygonId: PolygonId('polygon_id'),
          points: polygonPoints,
          strokeWidth: 3,
          strokeColor: Colors.black,
          fillColor: Colors.transparent,
        ),
      );
    });
  }

  Future<BitmapDescriptor> getMarkerImageFromUrl(String url) async {
    final File markerImageFile = await DefaultCacheManager().getSingleFile(url);
    return convertImageFileToBitmapDescriptor(markerImageFile);
  }

  Future<BitmapDescriptor> convertImageFileToBitmapDescriptor(
      File imageFile) async {
    const double size = 200;

    final Uint8List imageUint8List = await imageFile.readAsBytes();
    final ui.Codec codec = await ui.instantiateImageCodec(imageUint8List);
    final ui.FrameInfo imageFI = await codec.getNextFrame();

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Paint paint = Paint();
    final double radius = size / 2;

    // Here Draw a circle
    paint.color = Colors.transparent;
    paint.blendMode = BlendMode.srcOver;
    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      paint,
    );

    //Here Clip the canvas to the circle
    paint.blendMode = BlendMode.dstIn;
    canvas.clipRRect(RRect.fromRectAndRadius(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      Radius.circular(radius),
    ));

    // Paint the image inside the circle
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size, size),
      image: imageFI.image,
      fit: BoxFit.cover,
    );

    final ui.Image image = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final ByteData? data =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}
