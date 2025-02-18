import 'package:flutter/material.dart';
import 'google_map_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GoogleMapView(),
    );
  }
}


//https://maps.googleapis.com/maps/api/place/autocomplete/json?input=alex&key=AIzaSyATQST7P3F22EopGBW21Rf2mwB_QDmxjcQ