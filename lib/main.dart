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

// keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

