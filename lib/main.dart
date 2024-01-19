import 'package:flutter/material.dart';
import 'package:map_assignment/PolyLine.dart';
import 'package:map_assignment/mapAssignment.dart';
import 'package:map_assignment/poly%20line.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'Home_01',
    routes: {
      // 'Maps': (context) => Maps(),
      // 'Maps2': (context) => Maps2(),
      //'MyHomePage': (context) => MyHomePage(),
      //'Poly_line': (context) => Poly_line(),
      'Home_01': (context) => Home_01(),
    },
  ));
}
