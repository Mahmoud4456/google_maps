import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapView extends StatefulWidget {
  const FlutterMapView({super.key});

  @override
  State<FlutterMapView> createState() => _FlutterMapView();
}

class _FlutterMapView extends State<FlutterMapView> {
late LatLng initialCenter ;
 //String MapType = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}";
 MapController flutterMapController = MapController() ;
  @override
  void initState() {
    initialCenter = const LatLng(26.16718230960255, 32.72295348796703);
    super.initState();
  }
  @override
  void dispose() {
    flutterMapController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
        mapController: flutterMapController ,
        options: MapOptions(
          cameraConstraint: CameraConstraint.containCenter(
              bounds: LatLngBounds( const LatLng(25.999159964975323, 32.65284298754094),
                  const LatLng(26.3133636161193, 32.802791438245364),
              ),
          ),
          initialCenter:initialCenter,
          initialZoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          // RichAttributionWidget(
          //   attributions: [
          //     TextSourceAttribution(
          //       'OpenStreetMap contributors',
          //       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
          //     ),
          //     // Also add images...
          //   ],
          // ),
        ],
      ),
        Positioned(
          bottom: 15,
            left: 10,
            right: 10,
            child: ElevatedButton(onPressed: (){
              flutterMapController.move( const LatLng(26.17742741911928, 32.74735425188808), 13);
            }, child: const Text("Change "))),
      ]
    );
  }
}
