import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapModels {
  final int id ;
  final String name ;
  final LatLng location  ;
   IconData icon = Icons.location_pin ;
  MapModels ({ required this.id, required this.name, required this.location});

}
List<MapModels> places = [
  MapModels(id: 1, name: "مستشفي العام", location: const LatLng(26.15959620780124, 32.707254133575944 ,), ),
  MapModels(id: 2, name: "جامعة جنوب الوادي", location: const LatLng(26.191469143010647, 32.74514089328851), ),
  MapModels(id: 3, name: "جامع السيد عبد الرحيم ", location: const LatLng(26.165081350429915, 32.7264389942866), ),

];